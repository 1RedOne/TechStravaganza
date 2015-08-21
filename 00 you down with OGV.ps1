#OGV

Get-Service | Out-GridView -PassThru -Title "Pick Service to Restart" | Restart-service -WhatIf




#list of computers
"ComputerA","ComputerB","ComputerC" 

#pick a pc
#| out-gridview -PassThru -Title "Pick computer to restart services" 

#use Set-Service for remote systems