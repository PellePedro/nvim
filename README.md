## Nvim Configuration

## Install as container image 
```
docker pull docker.io/pellepedro/nvim:latest
```

## Recommended Start Script
```
copy <<EOF > start_nvim.sh
#/bin/bash

CONTAINER=docker.io/pellepedro/nvim:latest
docker run -it --rm --privileged --name dev \
    -v ${HOME}/.config/jesseduffield/lazygit:/home/devops/.config/lazygit:z \
    -v ${HOME}/.gitconfig:/home/devops/.gitconfig:z \
    -v ${HOME}/.netrc:/home/devops/.netrc:z \
    -v ${HOME}/.ssh:/home/devops/.ssh:z \
    -v ${HOME}/.gitconfig:/home/devops/.gitconfig:z \
    -v $(pwd):/home/devops/host:rw \
    -v ${HOME}/go/pkg/mod:/home/devops/go/pkg/mod:z \
    ${CONTAINER}
EOF

chmod +x start_nvim.sh 
```

## Command Line Tools
```
| key      | Mapping                       |
|----------|-------------------------------|
|  vifm    | vi file manager               |
|  rg      | ripgrep                       |

```

## Keymapping

### Leader/Magic keymapping '\\'
```
| key      | Mapping                       |
|----------|-------------------------------|
|  \ + fb  | List buffers                  |
|  \ + ff  | List file                     |
|  \ + fs  | Open fuzzy find file          |
|  \ + ff  | Open init.vim                 |
|  \ + gs  | Show GIt Status               |
|  \ + 2   | LSP List Document Symbols     |
|  \ + r   | LSP Rename                    |
|  \ + ca  | LSP code action               |
|  \ + cd  | LSP goto definition           |
|  \ + ci  | LSP goto implementation       |
|  \ + cr  | LSP List references           |
```


### keymapping hints
```
| key      | Mapping                       |
|----------|-------------------------------|
|  ciw     | change Inside Word            |
|  ci"     | change Inside ""              |
|  cf<c>   | change upto and including <n> |
|  ct<n>   | change upto not including <n> |
|  diw     | delete Inside Word            |
|  di"     | delete Inside ""              |
|  df<c>   | delete upto and including <n> |
|  dt<n>   | delete upto not including <n> |
```