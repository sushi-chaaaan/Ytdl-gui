@echo off
cd /D D:\ytdl
rem URL����
:URL
SET STR_INPUT=
set /P STR_INPUT="URL����͂��Ă�������:"
rem �`���I��+���s
echo **************************************
echo.
echo 1. mp4�`���Ń_�E�����[�h
echo 2. mp3�`���Ń_�E�����[�h
echo 3. �L�����Z��
echo.
echo **************************************
set ui=
set /p ui="1����3�œ����I�����Ă�������:"
if %ui%==1 (
  youtube-dl %STR_INPUT% -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" && explorer . && goto :END
) else if %ui%==2 (
  youtube-dl %STR_INPUT% -x -f "bestaudio" --audio-format mp3 --audio-quality 0 && explorer . && goto :END
) else if %ui%==3 (
  cls
  goto :URL
)
rem ���s�m�F
:END
echo *****************************************
echo �_�E�����[�h�͊������܂����B
echo �����ĕʂ̓���̃_�E�����[�h���s���܂���?
echo.
echo 1. �͂�
echo 2. ������(�E�B���h�E�����܂�)
echo *****************************************
set cont=
set /p cont="�I����������:"

if %cont%==1 (
  cls
  goto :URL
) else if %cont%==2 (
  exit
)
