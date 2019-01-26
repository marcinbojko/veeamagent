$ErrorActionPreference = 'Stop';

$packageName        = 'veeamagent'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url                = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_3.0.0.748.exe"
$url64              = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_3.0.0.748.exe"
$checksum           = "1f7e9b11080f96a9504d9b595d0efa23fa0b2c6cf35dc5691e51202a8209159e"
$checksum64         = "1f7e9b11080f96a9504d9b595d0efa23fa0b2c6cf35dc5691e51202a8209159e"
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
