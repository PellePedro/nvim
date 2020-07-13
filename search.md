# Searching and Replacing


## Search/Replace in Current Buffer

### Search Word Under Cursor
```
Press '*' to select the word under cursor
Press '*' again to search to next occurrence 

```

### Search for pattern with /
```
Press '/' and type search pattern <pattern>
Press 'n' to search for next occurrence.
Press 'N' to search for previous occurrence.
Press 'cgn' to replace current occurrence and go to next.
Press '.' to repeat replace current occurrence and go to next.
```

### Bulk Search/Replace in current file
```
Enter search/replace pattern in command mode ':%s/<search>/<replace>/gi'
Note: the % represent current file in command mode
Note: the flag i is optional for interactive mode
```
### Search and execute macro with g
```
Record a Macro e.g. @a
Issue 'g/<pattern>/norm! @a' to run macro @ for each match of <pattern> 
Save changes with :w
```

## Project wide Search/Replace (3 ways)

### CocSearch (LSP)
[Youtube ThePrimeagen](https://www.youtube.com/watch?v=q7gr6s8skt0)

```
- Perform a project wide search for text to be replaced with CocSearch 
  e.g. ':CocSearch <pattern> [-A 10]"
- Search result will be populated in one single buffer.  
- Perform search/replace in current buffer.
- Issue :w to save modifications in all files

```
### Rg (quickfix-reflector) 
```
- Perform a project wide search with rg ':Rg <patter>'
  Note: keyboard shortcut '\w' will perform "RG <cword>" 
        <cword> = word under cursor

- Search Result is listed in a fzf window

- Multi-select relevant lines to modify with tab, 
  then press enter to populate the quickfix window

- The quickfix window is editable by the 'quickfix-reflector' plugin.

- Alt select range (all lines) in quickfix window with 'VG' 
  visual line select to end of buffer  

- Perform search replace by :s/<search>/<replace>/g 
  (the % is not needed when using visual select)

- Save modification with :w in quickfix window
```


### Rg (with cdo)

```
- Perform a project wide search with rg ':Rg <patter>'
  Note: keyboard shortcut '\w' will perform "RG <cword>" 
        <cword> = word under cursor

- Search Result is listed in a fzf window

- Multi-select relevant lines to modify with tab, 
  then press enter to populate the quickfix window

- Issue command ':noa cdo norm! @a' or ':noa cdo g/foo/norm! @a' 

```