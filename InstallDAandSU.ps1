$SecureUpdaterurl = "https://secureupdater.s3.us-east-2.amazonaws.com/downloads/SecureUpdater.msi"
$SUoutpath = "$PSScriptRoot\SecureUpdater.msi"
$DriveAdvisorurl = "https://secureupdater.s3.us-east-2.amazonaws.com/downloads/driveadviser.msi"
$DAoutpath = "$PSScriptRoot\driveadvisor.msi"

#checks for SU and Drive Advisor, if not found installs them from the folders.
if (Test-Path -Path "C:\Program Files (x86)\Secure Updater\Secure Updater.exe") {
    Write-Host "SU is already installed"
}
else {
    Invoke-WebRequest -Uri $SecureUpdaterurl -OutFile $SUoutpath
    Start-Process $SUoutpath "/quiet"
}

if (Test-Path -Path "C:\Program Files (x86)\Drive Adviser\Drive Adviser.exe") {
    Write-Host "Drive Adviser already installed"
}
else {
    Invoke-WebRequest -Uri $DriveAdvisorurl -OutFile $DAoutpath
    Start-Process $DAoutpath "/quiet"
    Start-Process "C:\Program Files (x86)\Drive Adviser\Drive Adviser.exe"
}