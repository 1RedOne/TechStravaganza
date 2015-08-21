gci -path "C:\users\sred13\Dropbox\Speaking\TechStravaganza\0* *ps1" | % {
write-host "Loading " -NoNewline
write-host -ForegroundColor Yellow $_.BaseName -NoNewline
$psISE.CurrentPowerShellTab.Files.Add($_.FullName) | out-null
write-host ":[OK]" -ForegroundColor Green
}