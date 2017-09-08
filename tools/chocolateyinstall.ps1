$ErrorActionPreference = 'Stop';

$packageName        = 'veeamagent'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://s3-eu-west-1.amazonaws.com/public-choco/veeamagent/VeeamAgentWindows_2.0.0.594.exe"
$url_remote         = "https://s3-eu-west-1.amazonaws.com/public-choco/veeamagent/VeeamAgentWindows_2.0.0.594.exe"
$url_local64        = "https://s3-eu-west-1.amazonaws.com/public-choco/veeamagent/VeeamAgentWindows_2.0.0.594.exe"
$url_remote64       = "https://s3-eu-west-1.amazonaws.com/public-choco/veeamagent/VeeamAgentWindows_2.0.0.594.exe"
$url_local_trans    = ""
$url_remote_trans   = ""
$url                = ""
$url64              = ""
$url_trans          = ""
$checksum           = "f30d19c8f76aed67462820b004b1d4a5b60c2c7e014a4920d559e8382b3eb6c9"
$checksum64         = "f30d19c8f76aed67462820b004b1d4a5b60c2c7e014a4920d559e8382b3eb6c9"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"
$killexec           = 0
$killexecprocess    = ""
# Let's check if should we use local or remote install source
$statusCode = Test-Path $url_local
if ($statusCode) {
                    $url=$url_local
                    $url64=$url_local64
                    $url_trans=$url_local_trans
                }
    else {
        $url=$url_remote
        $url64=$url_remote64
        $url_trans=$url_remote_trans
    }

# Someone has won ;)

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
  }
  Start-Sleep -s 5
  Install-ChocolateyPackage @packageArgs

















