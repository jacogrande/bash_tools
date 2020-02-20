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
  Hashbrowns is a script that will take an input string and run it through a series of logic operations and compression functions, creating a unique hash.
  
  Before running the program, you'll have to give it the appropriate permissions with
  ```
  chmod 777 hashbrowns
  ```
  To run the script,
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
