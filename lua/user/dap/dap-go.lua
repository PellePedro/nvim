local ok, dapgo = pcall(require, "dap-go")
if not ok then
  print("pcall(require dap-go) failed")
  return
end

dapgo.setup() 
