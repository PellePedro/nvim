/*
 * Copyright Skyramp Authors 2022
 */

package loader

import (
	"fmt"
	"io/ioutil"
	"path"
	"path/filepath"

	"github.com/letsramp/dev/internal/messages"
	"github.com/letsramp/dev/pkg/types"
	"github.com/letsramp/dev/pkg/utils"

	"github.com/sirupsen/logrus"
	"gopkg.in/yaml.v3"
)

var log = logrus.WithField("module", "loader")

type DescriptorMetadata struct {
	Filename     string
	FileFullPath string
	FileContent  []byte
}

// Wrapper for Container Description
type ContainerDescriptor struct {
	Description *types.ContainerDescription

	// local table
	containerTable *SymbolTable
	portTable      *SymbolTable
	volumeTable    *SymbolTable
	endpointTable  *SymbolTable
	methodTable    map[string]*SymbolTable // method is bound to endpoints, so we maintain table per endpoint
	signatureTable *SymbolTable

	endpointToPort *SymbolTable

	ThriftOptions *types.ThriftOptions

	DescriptorMetadata
}

// Wrapper for Target Description
type TargetDescriptor struct {
	Description *types.TargetDescription

	// local table
	targetTable *SymbolTable

	DescriptorMetadata
}

type TestDescriptor struct {
	Description *types.TestDescription

	// local table
	testTable     *SymbolTable
	scenarioTable *SymbolTable
	commandTable  *SymbolTable
	requestTable  *SymbolTable

	DescriptorMetadata
}

// This is built whenever the binary is invoked
type SkyrampProject struct {
	Path string // Skyramp project top level directory path
	Name string // Name of project, inferred from project path

	TargetName string

	TestPath string // Test Description file path

	Containers []*ContainerDescriptor
	Target     *TargetDescriptor
	Test       *TestDescriptor

	// Global table
	containerTable           *SymbolTable
	portTable                *SymbolTable
	endpointTable            *SymbolTable
	signatureTable           *SymbolTable
	endpointToPort           *SymbolTable
	methodTable              map[string]*SymbolTable // method is bound to endpoint, so maintain table per endpoint
	containerDescriptorTable *SymbolTable

	MockWorkerImage string

	filePathDescriptorMapping map[string]*ContainerDescriptor // Used to map the filename
}

func NewSkyrampProject(path string, containers []*ContainerDescriptor, target *TargetDescriptor) *SkyrampProject {
	return &SkyrampProject{
		Path:       path,
		Containers: containers,
		Target:     target,

		containerTable:           NewContainerTable(),
		portTable:                NewPortTable(),
		endpointTable:            NewEndpointTable(),
		containerDescriptorTable: NewContainerDescriptorTable(),
	}
}

func ReadContainerDescription(filepath string) (*ContainerDescriptor, error) {
	yamlFile, err := ioutil.ReadFile(filepath)
	if err != nil {
		log.Errorf("Failed to read file %s: %v", filepath, err)
		return nil, err
	}

	description := &types.ContainerDescription{}
	err = yaml.Unmarshal(yamlFile, description)
	if err != nil {
		log.Errorf("Failed to unmarshal yaml %s: %v", filepath, err)
		return nil, err
	}

	return &ContainerDescriptor{
		Description:    description,
		containerTable: NewContainerTable(),
		portTable:      NewPortTable(),
		volumeTable:    NewVolumeTable(),
		endpointTable:  NewEndpointTable(),
		signatureTable: NewSignatureTable(),
		endpointToPort: NewPortTable(),

		DescriptorMetadata: DescriptorMetadata{
			Filename:     path.Base(filepath),
			FileFullPath: filepath,
			FileContent:  yamlFile,
		},
	}, nil
}

func ReadTargetDescription(filepath string) (*TargetDescriptor, error) {
	yamlFile, err := ioutil.ReadFile(filepath)
	if err != nil {
		log.Errorf("Failed to read file %s: %v", filepath, err)
		return nil, err
	}

	description := &types.TargetDescription{}
	err = yaml.Unmarshal(yamlFile, description)
	if err != nil {
		log.Errorf("Failed to unmarshal yaml %s: %v", filepath, err)
		return nil, err
	}

	return &TargetDescriptor{
		Description: description,
		targetTable: NewTargetTable(),

		DescriptorMetadata: DescriptorMetadata{
			Filename:     path.Base(filepath),
			FileFullPath: filepath,
			FileContent:  yamlFile,
		},
	}, nil
}

func ReadTestDescription(filepath string) (*TestDescriptor, error) {
	yamlFile, err := ioutil.ReadFile(filepath)
	if err != nil {
		log.Errorf("Failed to read file %s: %v", filepath, err)
		return nil, err
	}

	description := &types.TestDescription{}
	err = yaml.Unmarshal(yamlFile, description)
	if err != nil {
		log.Errorf("Failed to unmarshal yaml %s: %v", filepath, err)
		return nil, err
	}

	return &TestDescriptor{
		Description:   description,
		testTable:     NewTestTable(),
		commandTable:  NewTestCommandTable(),
		requestTable:  NewTestRequestTable(),
		scenarioTable: NewScenarioTable(),

		DescriptorMetadata: DescriptorMetadata{
			Filename:     path.Base(filepath),
			FileFullPath: filepath,
			FileContent:  yamlFile,
		},
	}, nil
}

func NewTestDescriptor(desc *types.TestDescription) *TestDescriptor {
	return &TestDescriptor{
		Description:  desc,
		testTable:    NewTestTable(),
		commandTable: NewTestCommandTable(),
		requestTable: NewTestRequestTable(),
	}
}

func getProjectName(projectDirName string) (string, error) {
	absPath, err := filepath.Abs(projectDirName)
	if err != nil {
		log.Errorf("failed to get absolute path of %s: %v", projectDirName, err)
		return "", fmt.Errorf("failed to get absolute path of %s: %w", projectDirName, err)
	}

	return filepath.Base(absPath), nil
}

func buildTargetPath(projectDirName, targetName string) string {
	return path.Join(projectDirName, types.TargetDirName, fmt.Sprintf("%s.yaml", targetName))
}

// Used to return a SkyrampProject without having to specify a target. This is useful
// for commands run prior to target bringup that still require knowledge of the container
// descriptions.
func ReadProjectDirectoryWithoutTarget(projectDirName string) (*SkyrampProject, error) {
	// read each file in container directory
	log.Infof("Reading project directory %s", projectDirName)

	projectName, err := getProjectName(projectDirName)
	if err != nil {
		return nil, fmt.Errorf("failed to get project name: %w", err)
	}

	files, err := ioutil.ReadDir(path.Join(projectDirName, types.ContainerDirName))
	if err != nil {
		return nil, fmt.Errorf("failed to read container directory: %w", err)
	}

	// read container description files
	var containerDescriptors []*ContainerDescriptor
	filePathDescriptorMapping := make(map[string]*ContainerDescriptor)

	for _, file := range files {
		if file.IsDir() {
			fmt.Printf("Skipping %s as it is a directory\n", file.Name())
			continue
		}

		if !utils.IsFileExtYaml(file.Name()) {
			fmt.Printf("Skipping %s as its extension is not .yaml or .yml\n", file.Name())
			continue
		}

		filePath := path.Join(projectDirName, types.ContainerDirName, file.Name())
		descriptor, err := ReadContainerDescription(filePath)
		if err != nil {
			fmt.Printf("Skipping %s as parsing failed\n", file.Name())
			log.Infof("Parsing %s failed: %v", file.Name(), err)
			continue
		}
		filePathDescriptorMapping[filePath] = descriptor

		log.Infof("Added container %s to project", file.Name())
		containerDescriptors = append(containerDescriptors, descriptor)
	}

	return &SkyrampProject{
		Path:                      projectDirName,
		Name:                      projectName,
		Containers:                containerDescriptors,
		containerTable:            NewContainerTable(),
		portTable:                 NewPortTable(),
		endpointTable:             NewEndpointTable(),
		signatureTable:            NewSignatureTable(),
		containerDescriptorTable:  NewContainerDescriptorTable(),
		filePathDescriptorMapping: filePathDescriptorMapping,
	}, nil
}

func ReadProjectDirectory(projectDirName, targetName string) (*SkyrampProject, error) {
	project, err := ReadProjectDirectoryWithoutTarget(projectDirName)
	if err != nil {
		return project, err
	}

	// read target description file
	err = project.LoadTargetDescription(targetName)
	if err != nil {
		return nil, err
	}

	return project, nil
}

func ReadProjectDirectoryWithTest(projectDirName, target, testPath string) (*SkyrampProject, error) {
	project, err := ReadProjectDirectoryWithoutTarget(projectDirName)
	if err != nil {
		return project, err
	}

	err = project.LoadTestDescription(testPath)
	if err != nil {
		return nil, err
	}

	// TODO load target description or get what is running
	// assume target is already running

	results, err := project.ValidateWithTest()
	if err != nil {
		log.Errorf("failed to validate test description: %v", err)
		return nil, fmt.Errorf(messages.FailedToValidate)
	}

	results.Print()

	if !results.IsValid() {
		return nil, fmt.Errorf(messages.FailedToValidate)
	}

	return project, nil
}

func (p *SkyrampProject) IsToMock(container string) bool {
	target := p.Target.GetTarget(container)
	if target == nil || !target.Mock {
		return false
	}

	return true
}

func (p *SkyrampProject) GetTargetName() string {
	return p.TargetName
}

func (p *SkyrampProject) LoadTargetDescription(targetName string) error {
	log.Infof("Reading target %s", targetName)

	// read target description file
	targetPath := buildTargetPath(p.Path, targetName)
	target, err := ReadTargetDescription(targetPath)
	if err != nil {
		return fmt.Errorf("failed to read target description: %w", err)
	}
	log.Infof("Read Target Description for \"%s\"", targetName)

	p.TargetName = targetName
	p.Target = target

	return nil
}

func (p *SkyrampProject) LoadTestDescription(filepath string) error {
	log.Infof("Reading test %s", filepath)

	// read test description file
	testDesc, err := ReadTestDescription(filepath)
	if err != nil {
		return fmt.Errorf("failed to read test description: %w", err)
	}
	log.Infof("Read Test Description for \"%s\"", filepath)

	p.TestPath = filepath
	p.Test = testDesc

	return nil
}

// Helper functions  -------------------------------
// just to remove layers for easier access
func (c *ContainerDescriptor) GetContainer(name string) *types.Container {
	if c.containerTable == nil {
		return nil
	}
	return c.containerTable.GetContainer(name)
}

func (c *ContainerDescriptor) PutContainer(v *types.Container) error {
	if c.containerTable == nil {
		c.containerTable = NewContainerTable()
	}

	return c.containerTable.Put(v.Name, v)
}

func (c *ContainerDescriptor) GetPort(name string) *types.Port {
	if c.portTable == nil {
		return nil
	}
	return c.portTable.GetPort(name)
}

func (c *ContainerDescriptor) PutPort(v *types.Port) error {
	if c.portTable == nil {
		c.portTable = NewPortTable()
	}

	return c.portTable.Put(v.Name, v)
}

func (c *ContainerDescriptor) GetPortForEndpoint(endpointName string) *types.Port {
	if c.endpointToPort == nil {
		return nil
	}

	return c.endpointToPort.GetPort(endpointName)
}

func (c *ContainerDescriptor) PutPortForEndpoint(endpointName string, v *types.Port) error {
	if c.endpointToPort == nil {
		c.endpointToPort = NewPortTable()
	}

	return c.endpointToPort.Put(endpointName, v)
}

func (c *ContainerDescriptor) GetEndpoint(name string) *types.Endpoint {
	if c.endpointTable == nil {
		return nil
	}
	return c.endpointTable.GetEndpoint(name)
}

func (c *ContainerDescriptor) PutEndpoint(v *types.Endpoint) error {
	if c.endpointTable == nil {
		c.endpointTable = NewEndpointTable()
	}

	return c.endpointTable.Put(v.Name, v)
}

func (c *ContainerDescriptor) GetVolume(name string) *types.Volume {
	if c.volumeTable == nil {
		return nil
	}

	return c.volumeTable.GetVolume(name)
}

func (c *ContainerDescriptor) PutVolume(v *types.Volume) error {
	if c.volumeTable == nil {
		c.volumeTable = NewVolumeTable()
	}

	return c.volumeTable.Put(v.Name, v)
}

func (c *ContainerDescriptor) GetMethod(endpointName, methodName string) *types.Method {
	if c.methodTable == nil {
		return nil
	}

	if c.methodTable[endpointName] == nil {
		return nil
	}

	return c.methodTable[endpointName].GetMethod(methodName)
}

func (c *ContainerDescriptor) PutMethod(endpointName string, v *types.Method) error {
	if c.methodTable == nil {
		c.methodTable = make(map[string]*SymbolTable)
	}
	if c.methodTable[endpointName] == nil {
		c.methodTable[endpointName] = NewMethodTable()
	}

	return c.methodTable[endpointName].Put(v.Name, v)
}

func (c *ContainerDescriptor) GetSignature(name string) *types.Signature {
	if c.signatureTable == nil {
		return nil
	}

	return c.signatureTable.GetSignature(name)
}

func (c *ContainerDescriptor) PutSignature(v *types.Signature) error {
	if c.signatureTable == nil {
		c.signatureTable = NewSignatureTable()
	}

	return c.signatureTable.Put(v.Name, v)
}

func (c *ContainerDescriptor) PutThriftOption(v *types.ThriftOptions) error {
	c.ThriftOptions = v
	return nil
}

func (t *TargetDescriptor) GetTarget(name string) *types.Target {
	if t.targetTable == nil {
		return nil
	}

	return t.targetTable.GetTarget(name)
}

func (t *TargetDescriptor) PutTarget(target *types.Target) error {
	if t.targetTable == nil {
		t.targetTable = NewTargetTable()
	}

	return t.targetTable.Put(target.Container, target)
}

func (t *TestDescriptor) PutTest(test *types.Test) error {
	if t.testTable == nil {
		t.testTable = NewTestTable()
	}

	return t.testTable.Put(test.Name, test)
}

func (t *TestDescriptor) GetTestCommand(name string) *types.TestCommand {
	if t.commandTable == nil {
		return nil
	}

	return t.commandTable.GetTestCommand(name)
}

func (t *TestDescriptor) PutTestCommand(command *types.TestCommand) error {
	if t.commandTable == nil {
		t.commandTable = NewTestCommandTable()
	}

	return t.commandTable.Put(command.Name, command)
}

func (t *TestDescriptor) GetTestRequest(name string) *types.TestRequest {
	if t.requestTable == nil {
		return nil
	}

	return t.requestTable.GetTestRequest(name)
}

func (t *TestDescriptor) PutTestRequest(request *types.TestRequest) error {
	if t.requestTable == nil {
		t.requestTable = NewTestRequestTable()
	}

	return t.requestTable.Put(request.Name, request)
}

func (t *TestDescriptor) GetScenario(name string) *types.TestScenario {
	if t.scenarioTable == nil {
		return nil
	}

	return t.scenarioTable.GetScenario(name)
}

func (t *TestDescriptor) PutScenario(scenario *types.TestScenario) error {
	if t.scenarioTable == nil {
		t.scenarioTable = NewScenarioTable()
	}

	return t.scenarioTable.Put(scenario.Name, scenario)
}

func (s *SkyrampProject) GetPortForEndpoint(endpointName string) *types.Port {
	if s.endpointToPort == nil {
		return nil
	}

	return s.endpointToPort.GetPort(endpointName)
}

func (s *SkyrampProject) PutPortForEndpoint(endpointName string, v *types.Port) error {
	if s.endpointToPort == nil {
		s.endpointToPort = NewPortTable()
	}

	return s.endpointToPort.Put(endpointName, v)
}

func (s *SkyrampProject) GetEndpoint(name string) *types.Endpoint {
	if s.endpointTable == nil {
		return nil
	}

	return s.endpointTable.GetEndpoint(name)
}

func (s *SkyrampProject) GetEndpoints() []*types.Endpoint {
	ret := []*types.Endpoint{}
	if s.endpointTable == nil {
		return ret
	}

	for key := range s.endpointTable.Entries {
		ret = append(ret, s.GetEndpoint(key))
	}

	return ret
}

func (s *SkyrampProject) PutEndpoint(endpoint *types.Endpoint) error {
	if s.endpointTable == nil {
		s.endpointTable = NewEndpointTable()
	}

	return s.endpointTable.Put(endpoint.Name, endpoint)
}

func (s *SkyrampProject) GetContainer(name string) *types.Container {
	if s.containerTable == nil {
		return nil
	}

	return s.containerTable.GetContainer(name)
}

func (s *SkyrampProject) PutContainer(container *types.Container) error {
	if s.containerTable == nil {
		s.containerTable = NewContainerTable()
	}

	return s.containerTable.Put(container.Name, container)
}

func (s *SkyrampProject) GetPort(name string) *types.Port {
	if s.portTable == nil {
		return nil
	}

	return s.portTable.GetPort(name)
}

func (s *SkyrampProject) PutPort(port *types.Port) error {
	if s.portTable == nil {
		s.portTable = NewPortTable()
	}

	return s.portTable.Put(port.Name, port)
}

func (s *SkyrampProject) GetTargets() []*types.Target {
	if s.Target == nil {
		return nil
	}

	return s.Target.Description.Targets
}

func (s *SkyrampProject) GetMethod(endpointName, methodName string) *types.Method {
	if s.methodTable == nil {
		return nil
	}

	if s.methodTable[endpointName] == nil {
		return nil
	}

	return s.methodTable[endpointName].GetMethod(methodName)
}

func (s *SkyrampProject) PutMethod(endpointName string, method *types.Method) error {
	if s.methodTable == nil {
		s.methodTable = make(map[string]*SymbolTable)
	}
	if s.methodTable[endpointName] == nil {
		s.methodTable[endpointName] = NewMethodTable()
	}

	return s.methodTable[endpointName].Put(method.Name, method)
}

func (s *SkyrampProject) GetSignature(name string) *types.Signature {
	if s.signatureTable == nil {
		return nil
	}

	return s.signatureTable.GetSignature(name)
}

func (s *SkyrampProject) PutSignature(v *types.Signature) error {
	if s.signatureTable == nil {
		s.signatureTable = NewSignatureTable()
	}

	return s.signatureTable.Put(v.Name, v)
}

func (s *SkyrampProject) GetContainerDescriptor(name string) *ContainerDescriptor {
	if s.containerDescriptorTable == nil {
		return nil
	}

	return s.containerDescriptorTable.GetContainerDescriptor(name)
}

func (s *SkyrampProject) PutContainerDescriptor(key string, cd *ContainerDescriptor) error {
	if s.containerDescriptorTable == nil {
		s.containerDescriptorTable = NewContainerDescriptorTable()
	}
	return s.containerDescriptorTable.Put(key, cd)
}

// traverses the Skyramp project, looking for the container descriptor file where the specified
// port with portName is defined. If no such file was found, an empty string and nil descriptor are returned.
// TODO: This is an O(n) operation. The behind the scenes data structures could possibly be refactored.
func (s *SkyrampProject) FindDescriptorFileForPort(portName string) (string, *ContainerDescriptor) {
	for filePath, containerDescriptor := range s.filePathDescriptorMapping {
		if containerDescriptor.GetPort(portName) != nil {
			return filePath, containerDescriptor
		}
	}

	return "", nil
}

func (s *SkyrampProject) GetTestDescription() *types.TestDescription {
	if s == nil {
		return nil
	}

	if s.Test == nil {
		return nil
	}

	return s.Test.Description
}

func (s *SkyrampProject) GetTestTarget() string {
	if s == nil {
		return ""
	}
	if s.Test == nil {
		return ""
	}
	if s.Test.Description == nil {
		return ""
	}

	var target string
	// FIXME: Assume all tests have same target
	for _, test := range s.Test.Description.Tests {
		return test.Target
	}

	return target
}

// for debugging
func PrintContainerDescription(desc *types.ContainerDescription) {
	data, err := yaml.Marshal(desc)
	if err != nil {
		log.Errorf("marshal failed: %v", err)
		return
	}

	fmt.Println(string(data))
}

// for debugging
func PrintTargetDescription(desc *types.TargetDescription) {
	data, err := yaml.Marshal(desc)
	if err != nil {
		log.Errorf("marshal failed: %v", err)
		return
	}

	fmt.Println(string(data))
}

// for debugging
func PrintTestDescription(desc *types.TestDescription) {
	data, err := yaml.Marshal(desc)
	if err != nil {
		log.Errorf("marshal failed: %v", err)
		return
	}

	fmt.Println(string(data))
}
