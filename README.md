## Nvim Configuration



## Install 
```
git clone --depth=0 https://github.com/pellepedro/nvim.git ~/.config/nvim
```


## Custom Keymapping

### \
```
| key      | Mapping                       |
|----------|-------------------------------|
|  \ + \   | Show only this buffer         |
|  \ + v   | Open init.vim                 |
|  \ + w   | Run ripgrep with <cword>       |
|  \ + d   | Show diagnostics              |
|  \ + r   | Cocsearch <cword>             |
|  \ + f   | Show type information         | 
|  \ + n   | number of matches for <cword> | 

```

### g
```
| key      | Mapping                       |
|----------|-------------------------------|
|  [ + g   | LSP disgnostic prev           |
|  ] + g   | LSP diagnostic next error     |
|  ] + c   | LSP fox current error         |
|  g + b   | git checkout/track branch     |
|  g + d   | LSP show diagnostics          |
|  g + c   | git show commits              |
|  g + d   | Goto definition               |
|  g + f   | Goto file                     |
|  g + h   | Show documentation            |
|  g + i   | LSP goto implementation       |
|  g + n   | Show diagnostics next         |
|  g + p   | Show diagnostic prev error    |
|  g + r   | LSP show reference            |
|  g + s   | git status                    |
|  g + y   | Goto type                     |
```

### <space>

```
| key      | Mapping                          |
|----------|----------------------------------|
| <sp>a    | Toggle last file                 |
| <sp>b    | Show Buffers                     |
| <sp>d    | Fetch data by http               |
| <sp>l    | Toggle none printable characters |
| <sp>u    | Show undotree                    |
| <sp>w    | Trim trailing whitespace         |
| <sp>/    | Search with Rg                   |
```
