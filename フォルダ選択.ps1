
#[void][Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{ 
    RootFolder = "MyComputer"
    Description = '�ۑ���t�H���_�����ꏊ��I�����Ă��������B
�f�X�N�g�b�v�t�H���_��I������ƃf�X�N�g�b�v�Ƀt�H���_����������܂��B'
}
 
if($FolderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){
    [System.Windows.MessageBox]::Show('�I�������t�H���_�F' + $FolderBrowser.SelectedPath)
}else{
    [System.Windows.MessageBox]::Show('�t�H���_�͑I������܂���ł����I')
}

$FolderBrowser.SelectedPath
