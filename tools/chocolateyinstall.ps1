$ErrorActionPreference = 'Stop';

$packageName        = 'veeamagent'
#$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url64              = "https://storage.googleapis.com/chocolatey/veeamagent/VeeamAgentWindows_3.0.2.1170.exe"
$checksum64         = "2f1ee160edc663293c576ea6383333e88992a600c0e8fe09353d7aed8ba1306d"
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
        Write-Output $logfile
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
