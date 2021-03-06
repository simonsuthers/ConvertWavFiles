######################
#set execution policy
Set-ExecutionPolicy Unrestricted

######################
# use sox to convert single wav file

$source = '"C:\Users\User\Documents\Data Science course\Test\SA1.WAV"'
$destination = '"C:\Users\User\Documents\Data Science course\Test\SA1_01.wav"'

$command = "sox $source $destination"

# Call CMD
cmd.exe /c $command

######################
# use sox to convert contents of one directory
# loop through all wav files in directory

# Get all wav files in directory
$files = Get-ChildItem "C:\Users\User\Documents\Data Science course\Test" -Filter *.WAV

# Loop through each file
Foreach ($file in $files)
{   
    # Set new name for the file
    $newname =  $file.FullName -ireplace [regex]::Escape(".wav"), "_01.wav"
    
    # Set source and destination files with commas around them
    $source = '"{0}"' -f $file.FullName
    $destination = '"{0}"' -f $newname
    
    # Call CMD to convert wav files
    $command = "sox $source $destination"
    cmd.exe /c $command
     
    # Print file location to console window
    Write-Host $destination
}

######################
# use sox to convert contents of directory and all child directories
# loop through all wav files in directory and child directories

# Original location of TIMIT files
$directory = "C:\Users\User\Documents\Data Science course\TIMIT\TIMIT"

# Folder to copy all new files to
$newdirectory = "C:\Users\User\Documents\Data Science course\TIMIT2"

# Get all wav files in TIMIT folder
$files = Get-ChildItem -Recurse $directory -Include *.WAV, *.txt

# Loop through all files converting to wav files
Foreach ($file in $files)
{   
    # Create new file name
    $newname =  [System.IO.FileInfo]($file.FullName -ireplace [regex]::Escape($directory), $newdirectory)
    
    # Find if folder currently exists
    $FileExists = Test-Path $newname.Directory.FullName
    
    # Create folder if it does not exist
    If ($FileExists -eq $False) 
    {
        New-Item -ItemType "directory" -Path $newname.Directory.FullName
    }
    
    # Set source and destination files with commas around them
    $source = '"{0}"' -f $file.FullName
    $destination = '"{0}"' -f $newname.FullName
    
    # Run sox to convert file if extension is wav
    $extn = [IO.Path]::GetExtension($file)
    if ($extn -eq ".wav" )
    {
        # Call CMD to convert wav files
        $command = "sox $source $destination"
        cmd.exe /c $command
    }
    
    # Copy file if extension is txt
    if ($extn -eq ".txt" )
    {
        Copy-Item $file -Destination $newname 
    }
    
    # Print file location to console window
    Write-Host $destination
}


######################





