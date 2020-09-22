# Search

## Search word under cursor
```
'*'
```

## Search based on pattern
```
/<pattern>
```

## Search based on pattern
```
/<pattern>
```

## Global Search
```
:Rg <pattern>

Custom Mapping: '<sp>/'
Custom Mapping: '\w'  global search <cword>

```

## Search/Replace Word Under Cursor in current Buffer
```
#1 Press '*' to visually select word under cursor in seach mode
#2 Change text by e.g. 'cgn' or '3cl'
#3 Press 'n' to jump to next match
#4 Press '.' to repeat the change     
```

## Batch Search and Replace in current Buffer
```
:%s/<search pattern>/<replace pattern>/g


Note: :%s/<pattern>//gn prints the number of matches 
Custom Mapping: '\n'
```

## LSP Refactoring 
```
:Cocsearch <pattern>
Custom Mapping: '\r'

Coc will display all matches in one buffer with <cword> selected
By changing the selected word in one place, all other matches will also be updates 

```