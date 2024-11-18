@echo off
:: Get the current directory from the parameter
set currentDir=%1

:: Ensure the path does not have quotes
set currentDir=%currentDir:"=%

:: Get the system date (parsed in DD/MM/YYYY format)
for /f "tokens=1-3 delims=./-" %%a in ('echo %date%') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

:: Extract the last two digits of the year
set shortYear=%year:~2,2%

:: Get the folder name from the user
set /p rootFolder=Enter the folder name: 

:: Combine folder name with month and year
set folderName=%currentDir%\%rootFolder%_%month%_%shortYear%

:: Create the folder structure
mkdir "%folderName%"
cd "%folderName%"
mkdir "01-INCOMING"
cd "01-INCOMING"
mkdir "01_DOCS" "02_IMAGES" "03_VECTORS" "04_LOGOS" "05_FONTS" "06_3D" "07_AUDIOS" "08_FOOTAGE" "09_OTHERS"
cd ..

mkdir "02-ASSETS"
cd "02-ASSETS"
mkdir "01_DOCS" "02_IMAGES" "03_VECTORS" "04_LOGOS" "05_FONTS" "06_3D" "07_AUDIOS" "08_FOOTAGE" "09_OTHERS"
cd ..

mkdir "03-RESEARCH"
mkdir "04-SOURCES"
cd "04-SOURCES"
mkdir "01_BLENDER" "02_AE" "03_PSD" "04_AI" "05_AR" "05_OTHERS"
cd ..

mkdir "05-OUTPUTS"
cd "05-OUTPUTS"
mkdir "00_RENDERS" "01_PREVIEWS"
cd ..

mkdir "06-REVIEW"
mkdir "07-DELIVERY"
mkdir "08-ARCHIVED"
mkdir "09-OTHERS"

echo %folderName% folder and subfolders were successfully created!
pause
