﻿#region gui
    #ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Class="BlogPostIII.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:BlogPostIII"
        mc:Ignorable="d"
        Title="FoxDeploy DSC Tool" Height="331.897" Width="491.207">
    <Grid x:Name="background" Background="#FF1B6FB7">
        <Image x:Name="image" HorizontalAlignment="Left" Height="111" Margin="10,0,0,0" VerticalAlignment="Top" Width="307" Source=".\Foxdeploy_FOX.png"/>
        <TextBlock x:Name="textBlock" HorizontalAlignment="Left" Margin="219,25,0,0" TextWrapping="WrapWithOverflow" VerticalAlignment="Top" Height="69" Width="266" FontSize="14.667">
        <Run Text='Provide values for these boxes and your machine will become a Domain Controller!'/>
        </TextBlock>
        <TextBox x:Name="DomainName" HorizontalAlignment="Left" Height="44" Margin="25,150,0,0" TextWrapping="Wrap" Text="FoxDeploy.local" VerticalAlignment="Top" Width="156" ToolTipService.ToolTip='Needs to be domainname.suffix, suffix could be .com, .test. or .local' FontSize="13.333"/>
        <Label x:Name="label" Content="Domain Name" HorizontalAlignment="Left" Height="29" Margin="25,116,0,0" VerticalAlignment="Top" Width="118" FontSize="13.333"/>
        <TextBox x:Name="UserName" HorizontalAlignment="Left" Height="44" Margin="259,150,0,0" TextWrapping="Wrap" Text="Domain\User" VerticalAlignment="Top" Width="156" ToolTipService.ToolTip='Should be the domain name\UserName' FontSize="13.333"/>
        <Label x:Name="label_Copy" Content="First Domain Admin" HorizontalAlignment="Left" Height="29" Margin="259,116,0,0" VerticalAlignment="Top" Width="136" FontSize="13.333"/>
        <Button x:Name="button" Content="Make me a Domain Controller!" HorizontalAlignment="Left" Height="50" Margin="136,226,0,0" VerticalAlignment="Top" Width="181"/>

    </Grid>
</Window>


 
"@ 
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
 
    $reader=(New-Object System.Xml.XmlNodeReader $xaml) 
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch [System.Management.Automation.MethodInvocationException] {
    Write-Warning "We ran into a problem with the XAML code.  Check the syntax for this control..."
    write-host $error[0].Exception.Message -ForegroundColor Red
    if ($error[0].Exception.Message -like "*button*"){
        write-warning "Ensure your &lt;button in the `$inputXML does NOT have a Click=ButtonClick property.  PS can't handle this`n`n`n`n"}
}
catch{#if it broke some other way <span class="wp-smiley wp-emoji wp-emoji-bigsmile" title=":D">:D</span>
    Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."
        }
 
#===========================================================================
# Store Form Objects In PowerShell
#===========================================================================
 
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
 
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}
 
Get-FormVariables
 
#===========================================================================
    # Use this space to add code to the various form elements in your GUI
    #===========================================================================
                                                                    
     
    #Reference 
 
    #Adding items to a dropdown/combo box
      #$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})
     
    #Setting the text of a text box to the current PC name    
      #$WPFtextBox.Text = $env:COMPUTERNAME
     
    #Adding code to a button, so that when clicked, it pings a system
    # $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
    # })
    #===========================================================================
    # Shows the form
    #===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
'$Form.ShowDialog() | out-null'
 
 #endregion GUI
 

$secpasswd = ConvertTo-SecureString 'IWouldLiketoRecoverPlease1!' -AsPlainText -Force
$SafeModePW = New-Object System.Management.Automation.PSCredential ('guest', $secpasswd)
 
$secpasswd = ConvertTo-SecureString 'IveGot$kills!' -AsPlainText -Force
$localuser = New-Object System.Management.Automation.PSCredential ('guest', $secpasswd)
 
configuration TestLab
{
     param
    (
        [string[]]$NodeName ='localhost',
        #[Parameter(Mandatory)][string]$MachineName,  
        $firstDomainAdmin,
        [Parameter(Mandatory)][string]$DomainName,
        [Parameter()]$SafeModePW,
        [Parameter()]$Password
    ) 
 
    #Import the required DSC Resources
    Import-DscResource -Module xActiveDirectory
    Import-DscResource -Module xComputerManagement 
 
    Node $NodeName
    { #ConfigurationBlock 
 
        <#
        xComputer NewNameAndWorkgroup
            {
                Name          = $MachineName
 
            }
            #>
 
        WindowsFeature ADDSInstall
        { 
 
            Ensure = 'Present'
            Name = 'AD-Domain-Services'
            IncludeAllSubFeature = $true
        }
 
        WindowsFeature RSATTools
        {
            DependsOn= '[WindowsFeature]ADDSInstall'
            Ensure = 'Present'
            Name = 'RSAT-AD-Tools'
            IncludeAllSubFeature = $true
        }
 
        
        <#
        xIPAddress NewIPAddress
        {
            IPAddress      = "10.20.30.1"
            InterfaceAlias = "Ethernet"
            SubnetMask     = 24
            AddressFamily  = "IPV4"
 
        }
        
        WindowsFeature DHCP {
            DependsOn = '[xIPAddress]NewIpAddress'
            Name = 'DHCP'
            Ensure = 'PRESENT'
            IncludeAllSubFeature = $true                                                                                                                              
 
        }  
 
        WindowsFeature DHCPTools
        {
            DependsOn= '[WindowsFeature]DHCP'
            Ensure = 'Present'
            Name = 'RSAT-DHCP'
            IncludeAllSubFeature = $true
        }  
        #>
 
        xADDomain SetupDomain {
            DomainAdministratorCredential= $firstDomainAdmin
            DomainName= $DomainName
            SafemodeAdministratorPassword= $SafeModePW
            DependsOn='[WindowsFeature]RSATTools'
            DomainNetbiosName = $DomainName.Split('.')[0]
        }
        <#Commented out for later
        xDhcpServerScope Scope
        {
         DependsOn = '[WindowsFeature]DHCP'
         Ensure = 'Present'
         IPEndRange = '10.20.30.250'
         IPStartRange = '10.20.30.5'
         Name = 'PowerShellScope'
         SubnetMask = '255.255.255.0'
         LeaseDuration = '00:08:00'
         State = 'Active'
         AddressFamily = 'IPv4'
        } 
 
        xDhcpServerOption Option
     {
         Ensure = 'Present'
         ScopeID = '10.20.30.0'
         DnsDomain = 'fox.test'
         DnsServerIPAddress = '10.20.30.1'
         AddressFamily = 'IPv4'
     }
     #>
 
    #End Configuration Block
    }
}
 
$configData = 'a'
 
$configData = @{
                AllNodes = @(
                              @{
                                 NodeName = 'localhost';
                                 PSDscAllowPlainTextPassword = $true
                                    }
                    )
               }

if (-not(test-path C:\PowerShell)){mkdir C:\PowerShell }
Set-Location C:\PowerShell

Write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
Write-host " FOXDeploy One Click Domain Controller "
Write-host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

$userDomain =  $WPFDomainName.Text
write-host "user specified new domain name of $userDomain" | tee -Append c:\powershell\DSCBuild.log
"although we are creating a new domain admin, you should log on to the machine with your credentials of <newdomainName>\$env:USERNAME"  | tee -Append c:\powershell\DSCBuild.log
TestLab -DomainName $userDomain -Password $localuser `
    -SafeModePW $SafeModePW -firstDomainAdmin (Get-Credential -UserName "$userDomain\FoxDeploy" -Message 'Specify Credentials for first domain admin' | tee -filePath  c:\powershell\DSCBuild.log -append) `
    -ConfigurationData $configData
 
Start-DscConfiguration -ComputerName localhost -Wait -Force -Verbose -path .\TestLab -Debug

1..10 | % {Write-warning "Time to reboot the machine!"; start-sleep -Milliseconds 400}

