@echo off
:start
if not exist screen_size.ini (
goto :error
)
for /f "tokens=1,2 delims=:" %%a in (screen_size.ini) do (
if %%a==height set window_height=%%b
if %%a==width set window_width=%%b
)
if not defined window_height (
del screen_size.ini
goto :error
)
if not defined window_width (
del screen_size.ini
goto :error
)
mode con:cols=%window_width% lines=%window_height%
set window_width=
set window_height=
goto :eof

:error
echo ###WINDOW SIZE###>screen_size.ini
echo # 1. Enter the properties of the window here>>screen_size.ini
echo # 2. Click [FILE]>[SAVE]>>screen_size.ini
echo # 3. Click [CLOSE]>>screen_size.ini
echo height:>>screen_size.ini
echo width:>>screen_size.ini

cls
notepad screen_size.ini
goto start