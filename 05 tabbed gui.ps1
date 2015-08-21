#ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
#

$inputXML = @"
<Window x:Class="Online_Tester.Window1"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:Online_Tester"
        mc:Ignorable="d"
        Title="FoxDeploy IT Tools" Height="345" Width="451">
    <Grid>
        <TabControl x:Name="tabControl" Foreground="#FF3A3A61" BorderBrush="#FF707092" Background="#FF1A1A1A">
            <TabItem Header="Test Computer" Background="#FF707092" BorderBrush="#FF1A1A1A">
                <Grid Background="#707092">

                    <TextBlock TextWrapping="WrapWithOverflow" VerticalAlignment="Top" Height="89" Width="314" Background="#00000000" Foreground="#FFFFF7F7" Margin="22,21,101,0" >
    This is the FoxDeploy official Awesome Tool.  To begin using this tool, first verify that a system if online, and then progress to any of the above tabs.


                    </TextBlock>

                    <TextBox x:Name="ComputerName" TextWrapping="Wrap" HorizontalAlignment="Left" Height="32" Margin="21,142,0,0" Text="TextBox" VerticalAlignment="Top" Width="135" FontSize="14.667"/>
                    <Button x:Name="Button" Content="Verify Online" HorizontalAlignment="Left" Margin="174,142,0,0" VerticalAlignment="Top" Width="93" Height="32"/>
                    <Image x:Name="image1" Stretch="UniformToFill" HorizontalAlignment="Left" Height="80" Margin="10,174,0,0" VerticalAlignment="Top" Width="245" Source="C:\Users\Stephen\Dropbox\Speaking\Demos\module 13\Foxdeploy_DEPLOY_large.png"/>
                </Grid>
            </TabItem>
            <TabItem Header="System Info" Background="#FF707092" BorderBrush="#FF1A1A1A" IsEnabled="False">
                <Grid Background="#707092"/>
            </TabItem>
            <TabItem Header="Services" Background="#FF707092" BorderBrush="#FF1A1A1A" IsEnabled="False">
                <Grid Background="#707092"/>
            </TabItem>
            <TabItem Header="Processes" Background="#FF707092" BorderBrush="#FF1A1A1A" IsEnabled="False">
                <Grid Background="#707092"/>
            </TabItem>
        </TabControl>
        <StatusBar Height="25" Margin="0,244,0,0" VerticalAlignment="Bottom" Background="#FF242450">
            <Separator/>
            <TextBlock x:Name="Status_textBlock" TextWrapping="Wrap" Text="Status : " Foreground="#FF9999B0"/>
        </StatusBar>
        <Image x:Name="image" HorizontalAlignment="Left" Height="100" Margin="-265,163,0,0" VerticalAlignment="Top" Width="100"/>

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
catch{#if it broke some other way :D
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


$WPFButton.Add_Click({
    $WPFStatus_textBlock.Text = "Status : Pinging..."
    if (Test-Connection $WPFComputerName.Text -Count 1 -Quiet){
        $WPFStatus_textBlock.Text = "Status : Online"
        ForEach ($item in $WPFtabControl.Items){$item.IsEnabled = $true}
}
        else{$WPFStatus_textBlock.Text = "Status : Offline"

            }
    })


#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
'$Form.ShowDialog() | out-null'