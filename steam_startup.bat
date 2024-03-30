@echo off

if not "%Minimized%"=="" goto :Minimized
set Minimized=True
start /min cmd /C "%~dpnx0"
goto :EOF
:Minimized

start /B "" "C:\Program Files (x86)\Steam\Steam.exe" -noverifyfiles &

if exist "%UserProfile%\Videos\ffplay.exe" (
    if exist "%UserProfile%\Videos\Boot.webm" (

        start /B "" "%UserProfile%\Videos\ffplay.exe" -left 0 -top 0 -x %ScreenWidth% -y %ScreenHeight% -alwaysontop -fullscreen -noborder -autoexit -loglevel quiet -loop 1 "%UserProfile%\Videos\Boot.webm" 2>NUL
    ) else (
        echo "Boot.webm not found."
    )
) else (
    echo "ffplay.exe not found."
)

timeout /t 2
start explorer.exe
call random_boot_movie.bat