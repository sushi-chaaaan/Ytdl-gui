@echo off

rem 利用にあたっての注意
echo *********************************************************
echo ダウンロードしていただき、ありがとうございます。
echo セットアップを開始する前に必ず同梱してある
echo txtファイルを読んでください。
echo セットアップの仕方を間違えると動作しなくなります。
echo また、利用にあたっての注意点や利用方法も記載されています。
echo *********************************************************
pause

rem カレントディレクトリをフォルダへ
cd /d %~dp0

rem PowerShellからフォルダを取得
FOR /F "usebackq" %%i IN (`powershell -executionpolicy bypass -File フォルダ選択.ps1`) DO SET VALUE=%%i

rem 指定したフォルダへ保存先フォルダを作成
cd /d %VALUE%

md 保存先

rem コンポーネントを保存先へ移動
cd /d %~dp0
move *.exe %VALUE%\保存先

rem コンポーネントに隠しファイル属性を追加
cd /d %VALUE%\保存先
attrib +h youtube-dl.exe
attrib +h ffmpeg.exe

rem デスクトップへショートカットを移動
move YouTubeダウンロード.lnk %USERNAME%\Desktop

rem バッチファイルの保存先フォルダの指定を変更
cd /d %~dp0

rem 入力ファイル
set infilenm=ytdl.bat
rem 出力ファイル
set outfilenm=ytdl2.bat
rem 置換前文字列
set beforestr=D:\ytdl
rem 置換後文字列
set afterstr=%VALUE%\保存先
 
rem 出力ファイル作成
type nul >%outfilenm%
 
rem ファイル編集
setlocal enabledelayedexpansion
for /f "delims=" %%A in (%infilenm%) do (
    set line=%%A
    echo !line:%beforestr%=%afterstr%!>>%outfilenm%
)
endlocal

rem ytdl.batを削除
del ytdl.bat

rem ytdl2をリネーム
ren ytdl2.bat ytdl.bat