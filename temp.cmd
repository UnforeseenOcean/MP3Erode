@echo off
echo Advanced MP3 Degrader
echo 2016 Blackwood, No Rights Reserved
echo Thanks for checking my stuff out!
echo.
echo Please name a WAV file as ufile(starting position).wav
echo And put it in the same directory as the script!
echo.
set /p countin=Set starting position (Type 0 to start over): 
set /p stopcount=Stop after nth file: (Type desired range, minimum 1): 

set /a countout=%countin%
set /a countwavo=%countin%
set /a delcache=%countin%
set /a countwavi=%countin%+1

:start
ffmpeg -i ufile%countwavo%.wav -codec:a libmp3lame -qscale:a 1 file%countout%.mp3
ffmpeg -i file%countout%.mp3 -acodec pcm_u8 -ar 44100 ufile%countwavi%.wav
set /a countin=%countin%+1
set /a countout=%countout%+1
set /a countwavi=%countwavi%+1
set /a countwavo=%countwavo%+1
:: Set the serial number of cache
set /a delcache=%countout%-1
:: Delete cache file
del ufile%delcache%.wav
if exist file%stopcount%.mp3 (goto stop) else goto start
:stop
echo.
echo Queue finished
pause