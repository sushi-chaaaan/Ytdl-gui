@echo off

rem ���p�ɂ������Ă̒���
echo *********************************************************
echo �_�E�����[�h���Ă��������A���肪�Ƃ��������܂��B
echo �Z�b�g�A�b�v���J�n����O�ɕK���������Ă���
echo txt�t�@�C����ǂ�ł��������B
echo �Z�b�g�A�b�v�̎d�����ԈႦ��Ɠ��삵�Ȃ��Ȃ�܂��B
echo �܂��A���p�ɂ������Ă̒��ӓ_�◘�p���@���L�ڂ���Ă��܂��B
echo *********************************************************
pause

rem �J�����g�f�B���N�g�����t�H���_��
cd /d %~dp0

rem PowerShell����t�H���_���擾
FOR /F "usebackq" %%i IN (`powershell -executionpolicy bypass -File �t�H���_�I��.ps1`) DO SET VALUE=%%i

rem �w�肵���t�H���_�֕ۑ���t�H���_���쐬
cd /d %VALUE%

md �ۑ���

rem �R���|�[�l���g��ۑ���ֈړ�
cd /d %~dp0
move *.exe %VALUE%\�ۑ���

rem �R���|�[�l���g�ɉB���t�@�C��������ǉ�
cd /d %VALUE%\�ۑ���
attrib +h youtube-dl.exe
attrib +h ffmpeg.exe

rem �f�X�N�g�b�v�փV���[�g�J�b�g���ړ�
move YouTube�_�E�����[�h.lnk %USERNAME%\Desktop

rem �o�b�`�t�@�C���̕ۑ���t�H���_�̎w���ύX
cd /d %~dp0

rem ���̓t�@�C��
set infilenm=ytdl.bat
rem �o�̓t�@�C��
set outfilenm=ytdl2.bat
rem �u���O������
set beforestr=D:\ytdl
rem �u���㕶����
set afterstr=%VALUE%\�ۑ���
 
rem �o�̓t�@�C���쐬
type nul >%outfilenm%
 
rem �t�@�C���ҏW
setlocal enabledelayedexpansion
for /f "delims=" %%A in (%infilenm%) do (
    set line=%%A
    echo !line:%beforestr%=%afterstr%!>>%outfilenm%
)
endlocal

rem ytdl.bat���폜
del ytdl.bat

rem ytdl2�����l�[��
ren ytdl2.bat ytdl.bat