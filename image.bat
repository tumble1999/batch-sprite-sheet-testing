@echo off
call batbox
call screen_size
for /f "tokens=1,2 delims=~" %%a in (sprite.txt) do (
batbox /c 0x%%a /d "%%b"
echo.
)
pause