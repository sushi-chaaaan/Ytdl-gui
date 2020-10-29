
#[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{ 
    RootFolder = "MyComputer"
    Description = '保存先フォルダを作る場所を選択してください。
デスクトップフォルダを選択するとデスクトップにフォルダが生成されます。'
}
 
if($FolderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){
    [System.Windows.MessageBox]::Show('選択したフォルダ：' + $FolderBrowser.SelectedPath)
}else{
    [System.Windows.MessageBox]::Show('フォルダは選択されませんでした！')
}

$FolderBrowser.SelectedPath
