$xmlFileName = $home + "\Desktop\Drive Adviser.xml"
$xmlurl = "https://secureupdater.s3.us-east-2.amazonaws.com/downloads/Drive+Adviser.xml"
$userID = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value

#download the XML for Drive Advisor schedualed task
Invoke-RestMethod -Uri $xmlurl -OutFile $xmlFileName
#Read in the XML document
[xml]$xmlDoc = (Get-Content $xmlFileName)
#Modify the UserID string to be the current loged in user
$xmlDoc.Task.Principals.Principal.UserId = $userID
#Save the new xml
$xmlDoc.Save($xmlFileName)
#Import into schedualed tasks
schtasks.exe /Create /XML $xmlFileName /tn "Drive Advisor"
#Delete the XML
Remove-Item -Path $xmlFileName