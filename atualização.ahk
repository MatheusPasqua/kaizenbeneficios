#NoTrayIcon
IniRead, ver_1, versao.ini, conf, version
FileCreateDir, temp
UrlDownloadToFile, https://www.dropbox.com/s/2gpawbaz13612a4/versao.ini?dl=1, temp\versao.ini
IniRead, ver_2, temp\versao.ini, conf, version
if (ver_1 < ver_2) {
    MsgBox, 262144, Atualização, Uma nova atualização foi encontrada`, aperte "Ok" e aguarde enquanto é feito o download.
    UrlDownloadToFile, https://www.dropbox.com/s/hdfw9ycvalua6g8/Setup.exe?dl=1, setup.exe
    RunWait, setup.exe
}
ExitApp