$ErrorActionPreference = 'Stop';

$packageName        = 'veeamagent'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url64              = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_3.0.1.1039.exe"
$checksum64         = "d69893a893ac86da6f644aee9052f180830396b9eba81506e75a00506fa52271"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"
$killexec           = 0
$killexecprocess    = ""

#Let's check your TEMP derectory

$statusCode = Test-Path $logdir
if ($statusCode) {
                }
    else {
        $logfile="$env:WINDIR\TEMP\chocolatey\$($packageName).MsiInstall.log"

    }

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  silentArgs    = "/silent /accepteula /acceptthirdpartylicenses"
  validExitCodes= @(0, 3010, 1641,1000,1101)
  url64bit      = $url64
  checksumType64= 'sha256'
  checksum64    = $checksum64
}

# Should we kill some exec ?
if ($killexec) {
  Stop-Process -processname $killexecprocess -force
  Start-Sleep -s 5
}

Install-ChocolateyPackage @packageArgs
