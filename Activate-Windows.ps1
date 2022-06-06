#Activate-Windows
#check activation status, and if windows isnt activated try installing the key from bios
$activationStatus = Get-CIMInstance -query "select Name, LicenseStatus from SoftwareLicensingProduct where LicenseStatus=1 and Name LIKE 'Wind%'"
if (!$activationStatus) {
    $biosKey = (Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey
    if ($biosKey) {
        slmgr.vbs /ipk $biosKey
        slmgr.vbs /ato
        else {
            $windowsKey = Read-Host -Prompt 'Imput the windows key now'
            slmgr.vbs /ipk $windowsKey
            slmgr.vbs /ato
        }
    }
}