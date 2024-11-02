@echo off
setlocal enabledelayedexpansion

:: Set the source and destination directories
set "source_folder=.\"
set "destination_folder=.\out\"

:: Create destination folder if it doesn't exist
if not exist "%destination_folder%" mkdir "%destination_folder%"

:: Initialize counters
set /a subfolder_num=-33
set /a file_num=0

:: Loop through all files in the source folder
for %%f in ("%source_folder%\*.png") do (
    :: Check if we need to move to the next subfolder
    if !file_num! GEQ 38 (
        set /a subfolder_num+=1
        set /a file_num=0
    )

    :: Create the subfolder if it doesn’t exist
    set "subfolder_name=%destination_folder%\!subfolder_num!"
    if not exist "!subfolder_name!" mkdir "!subfolder_name!"

    :: Move and rename the file
    set "new_filename=!file_num!"
    move "%%f" "!subfolder_name!\!new_filename!.png"

    :: Increment the file counter
    set /a file_num+=1
)

echo Files have been organized and renamed.
endlocal
pause
