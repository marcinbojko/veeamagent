$ErrorActionPreference = 'Stop';

$packageName        = 'veeamagent'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url                = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_2.2.0.589.exe"
$url64              = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_2.2.0.589.exe"
$checksum           = "b1aceb0d7e541930093b58896c36cf662fde419a337b72d5dc20bbeabafb7495"
$checksum64         = "b1aceb0d7e541930093b58896c36cf662fde419a337b72d5dc20bbeabafb7495"
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
  silentArgs    = "/silent /accepteula"
  validExitCodes= @(0, 3010, 1641,1000)
  url           = $url
  url64bit      = $url64
  checksumType  = 'sha256'
  checksumType64= 'sha256'
  checksum      = $checksum
  checksum64    = $checksum64
}

# Should we kill some exec ?
if ($killexec) {
  Stop-Process -processname $killexecprocess -force
  Start-Sleep -s 5
}

Install-ChocolateyPackage @packageArgs
