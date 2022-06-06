#SetPassword to never expire
$userNames = Get-LocalUser
foreach ($accoutnname in $userNames.Name) {
    Set-LocalUser $accoutnname -PasswordNeverExpires
}