# ConvertWavFiles

Downlaod sox for windows from:
http://sox.sourceforge.net/

Install the software by running exe.

Add sox to registry path

Run ConvertWavFiles.ps1 in powershell

Powershell file has 3 routines, the last one is the important one.

The three rutines do the following:
1. Converts a specific file to a .wav file using sox
2. Converts all files in a directory with a specific extension to .wav
3. Converts all files in a directory and all child directories with a specific extension to .wav

The final routine copies all .wav files and all .txt files in a folder to a new folder. It also converts the .wav files to the standard .wav format using sox.
