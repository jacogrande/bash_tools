# bash_tools
  A janky library of homemade bash tools.
  
## Elefahnt
  Elefahnt is a script that prints and speaks the users input
  ```
  ./elefahnt "testing..." [-mR]
  ```
### -m
  give the element a mask

### -R
  make the color of the mask random

## Hashbrowns
  Hashbrowns is a script that will give you a hash of the user input
  ```
  ./hashbrowns "testing..." [-v]
  ```
### -v
  hashes in verbose mode

### note: reading files
  To get the hash of a file
  ```
  ./hashbrowns "$(cat filename)" [-v]
  ```
