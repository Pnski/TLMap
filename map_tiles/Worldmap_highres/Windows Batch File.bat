@echo off
setlocal enabledelayedexpansion

:: Set source and destination directories
set "source_folder=.\"
set "destination_folder=.\"

:: Set zoom level
set zoom_level=0

:: Initialize counters
set /a x=0
set /a y=0

:: Loop through each file in the source folder
for /L %%i in (0,1,1291) do (
    :: Create destination path
    set "dest_path=%destination_folder%"

    :: Create folders if they don't exist
    if not exist "!dest_path!" mkdir "!dest_path!"

    :: Move and rename the file to its Leaflet structure
    move "%source_folder%\%%i.png" "!dest_path!\!x!_!y!.png"

    :: Increment y for next tile in the row
    set /a x+=1

    :: Check if we need to start a new column
    if !x! GEQ 38 (
        set /a x=0
        set /a y+=1
    )
)

echo Files have been organized into folders for Leaflet.
endlocal
pause
