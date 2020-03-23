# Basic Bash Commands
- **man:** brings up the manual page for a given command
- **echo:** Prints a message to the terminal
- **pwd:** Prints the working directory
- **tree:** Prints whole file tree
- **ls:** View files within a given folder
  - **ls -a:** Option for viewing hidden folders
  - **ls -l:** Option for viewing more detail
  - **ls ~:** Option for viewing home directory
- **cd:** Change directory
- **mkdir:** Make a new directory
- **mv:** Move a file from one name to another
- **touch:** Create a new empty file
- **rm:** Remove a file
- **rmdir:** Remove an empty directory
- **cat:** Read file
- **less:** Read a file one screen at a time
  - **Spacebar:** Go to the next screen
  - **b:** Go to the previous screen
  - **/:** Search for a specific word
  - **q:** quit
- **grep:** file 
  - **wc:**
  - **sort:**
  - **uniq:**
The pipe | combines two commands, placing the output of the left command to the input of the right command. For example the following will count the words in the file example.txt
```{sh}cat example.txt | wc -w```
