@echo off
cd /D D:\ytdl
rem URL入力
:URL
SET STR_INPUT=
set /P STR_INPUT="URLを入力してください:"
rem 形式選択+実行
echo **************************************
echo.
echo 1. mp4形式でダウンロード
echo 2. mp3形式でダウンロード
echo 3. キャンセル
echo.
echo **************************************
set ui=
set /p ui="1から3で動作を選択してください:"
if %ui%==1 (
  youtube-dl %STR_INPUT% -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" && explorer . && goto :END
) else if %ui%==2 (
  youtube-dl %STR_INPUT% -x -f "bestaudio" --audio-format mp3 --audio-quality 0 && explorer . && goto :END
) else if %ui%==3 (
  cls
  goto :URL
)
rem 続行確認
:END
echo *****************************************
echo ダウンロードは完了しました。
echo 続けて別の動画のダウンロードを行いますか?
echo.
echo 1. はい
echo 2. いいえ(ウィンドウが閉じます)
echo *****************************************
set cont=
set /p cont="選択した動作:"

if %cont%==1 (
  cls
  goto :URL
) else if %cont%==2 (
  exit
)
