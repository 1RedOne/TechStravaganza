if (-not(test-path C:\PowerShell)){mkdir C:\PowerShell }
Set-Location C:\PowerShell

cls 

Write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
Write-host " FOXDeploy One Click Domain Controller "
Write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

Write-host "This tool will walk you through a few key configurations, then create a DSC Config"
Write-host "*Your machine will ask to be rebooted at the end"
Write-host "*You will need to specify both a domain name, and then the desired name of the first Domain Admin"

"`n`n"

Write-host '***Your username of ' -NoNewline
Write-host -ForegroundColor Cyan $env:USERNAME -NoNewline
Write-host ' will also be made a domain admin as well***'
"`n`n`n"
write-warning "Domain names must end in .local or .test"
$userDomain =  read-host "Specify your desired domain name, you'll use this the next time you login"
"user specified domain name of $userDomain" >> c:\powershell\DSCBuild.log

Write-host -ForegroundColor Cyan 'Beggining DSC Application'
