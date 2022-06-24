# Powershell Based AutoVol
This is a powershell based script that automatically runs plugins from volatility3
Full credit goes out to the team behind the awesome volatility foundation [volatilityfoundation.org/](https://www.volatilityfoundation.org/)
Link to volatility3: https://github.com/volatilityfoundation/volatility3

## Program Functionality
This program runs plugins from volatility3 on memory images, and pipes those outputs to txt files for user analysis. There is also an option to specify a process ID to run memory analysis on that particular process ID. This will save you time and manual labour when doing memory analysis.

## Installation Guide
1. Install volatility3 from `https://github.com/volatilityfoundation/volatility3`
2. Follow installation instructions for vol3
3. Navigate to volatility3 folder on your computer
4. Open cmd window and run 
``` git clone https://github.com/volatilityfoundation/volatility3 ```

## Usage Guide
Place memory files to analyse in the `\PlaceMemFilesHere\` subdirectory once installed. 

Run the script in powershell using the parameters listed below. For example... <br />
``` .\autoVol.ps1 -f "FILENAME" ```
``` .\autoVol.ps1 -f "FILENAME" -p "PROCESS ID" ```
``` .\autoVol.ps1 -h ```

## Parameters
#### -h
Help
#### -f "FILENAME"
Specify the filename to analyse
#### -p "PROCESS ID"
Specify the process ID to analyse
