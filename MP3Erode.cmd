set /a inc1=0
set /a inc2=1
:start
ffmpeg -i %inc1%.mp3 -codec:a libmp3lame -qscale:a 5 %inc2%.mp3
set /a inc1=inc1+1
set /a inc2=inc2+1
::timeout /t 3 >nul
goto start