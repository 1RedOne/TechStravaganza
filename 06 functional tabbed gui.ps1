#
#
# Proceed to VM 2
#
#


    #ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Class="BlogPostIII.TabbedInt"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:BlogPostIII"
        mc:Ignorable="d"
        Title="FoxDeploy AD Tool" Height="376.8" Width="784.5" Background="#FF1D3245">
    <Grid Margin="0,0,3.8,10" Background="#FF1D3245">
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="42*"/>
            <ColumnDefinition/>
        </Grid.ColumnDefinitions>
        <TabControl x:Name="tabControl" HorizontalAlignment="Left" Height="338" VerticalAlignment="Top" Width="788">
            <TabItem Header="NewUser">
                <TabItem.Background>
                    <LinearGradientBrush EndPoint="0,1" StartPoint="0,0">
                        <GradientStop Color="#FFF0F0F0" Offset="0"/>
                        <GradientStop Color="#FF897C7C" Offset="1"/>
                    </LinearGradientBrush>
                </TabItem.Background>
                <Grid Background="#FF1D3245">
                    <Button x:Name="MakeUserbutton" Content="Create User" HorizontalAlignment="Left" Height="34" Margin="10,277,0,0" VerticalAlignment="Top" Width="155" FontSize="14.667"/>
                    <CheckBox x:Name="checkBox" Content="Temporary User?" HorizontalAlignment="Left" Height="36" Margin="10,176,0,0" VerticalAlignment="Top" Width="140" FontSize="14.667" Foreground="White"/>
                    <Label x:Name="label" Content="Use this tab to create a new user" HorizontalAlignment="Left" Height="37" Margin="10,10,0,0" VerticalAlignment="Top" Width="274" Foreground="White"/>
                    <TextBox x:Name="firstName" HorizontalAlignment="Left" Height="25" Margin="165,47,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="119" FontSize="14.667"/>
                    <TextBlock x:Name="firstName_label" HorizontalAlignment="Left" Height="25" Margin="19,47,0,0" TextWrapping="Wrap" Text="First Name" VerticalAlignment="Top" Width="118" Background="#FF98BCD4" FontSize="16"/>
                    <TextBox x:Name="lastName" HorizontalAlignment="Left" Height="25" Margin="165,89,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="119" FontSize="14.667"/>
                    <TextBlock x:Name="lastName_label" HorizontalAlignment="Left" Height="25" Margin="19,89,0,0" TextWrapping="Wrap" Text="Last Name" VerticalAlignment="Top" Width="118" Background="#FF98BCD4" FontSize="16"/>
                    <TextBox x:Name="logonName" HorizontalAlignment="Left" Height="25" Margin="165,130,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="119" FontSize="14.667"/>
                    <TextBlock x:Name="logonName_label" HorizontalAlignment="Left" Height="25" Margin="19,130,0,0" TextWrapping="Wrap" Text="Logon Name" VerticalAlignment="Top" Width="118" Background="#FF98BCD4" FontSize="16"/>
                    <Separator HorizontalAlignment="Left" Height="30" Margin="19,155,0,0" VerticalAlignment="Top" Width="265" RenderTransformOrigin="-1.016,-0.225"/>
                    <RadioButton x:Name="radioButton_7" Content="7 Days" HorizontalAlignment="Left" Height="20" Margin="42,200,0,0" VerticalAlignment="Top" Width="108" RenderTransformOrigin="0.861,0.107" FontSize="14.667" Background="#FFF9F2F2" Foreground="White" IsEnabled="False"/>
                    <RadioButton x:Name="radioButton_30" Content="30 Days" HorizontalAlignment="Left" Height="20" Margin="42,225,0,0" VerticalAlignment="Top" Width="108" RenderTransformOrigin="0.861,0.107" FontSize="14.667" Background="#FFF9F2F2" Foreground="White" IsEnabled="False"/>
                    <RadioButton x:Name="radioButton_90" Content="90 Days" HorizontalAlignment="Left" Height="20" Margin="42,250,0,0" VerticalAlignment="Top" Width="108" RenderTransformOrigin="0.861,0.107" FontSize="14.667" Background="#FFF9F2F2" Foreground="White" IsEnabled="False"/>
                    <TextBox x:Name="password" HorizontalAlignment="Left" Height="25" Margin="415,47,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="119" FontSize="14.667" RenderTransformOrigin="0.5,0.5"/>
                    <TextBlock x:Name="password_label" HorizontalAlignment="Left" Height="25" Margin="303,47,0,0" TextWrapping="Wrap" Text="Password" VerticalAlignment="Top" Width="91" Background="#FF98BCD4" FontSize="16"/>
                    <TextBlock x:Name="targetOU_label" HorizontalAlignment="Left" Height="25" Margin="303,89,0,0" TextWrapping="Wrap" Text="Target OU" VerticalAlignment="Top" Width="91" Background="#FF98BCD4" FontSize="16"/>
                    <ComboBox x:Name="targetOU_comboBox" HorizontalAlignment="Left" Margin="415,92,-18,0" VerticalAlignment="Top" Width="120"/>
                    <TextBlock x:Name="DefaultOUMsg" Text ="If TargetOu not specified, user will be placed in the @anchor OU" HorizontalAlignment="Left" Margin="303,130,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Foreground="#FFFBFAFA" FontSize="14.667"/>
                </Grid>
            </TabItem>
            <TabItem Header="Unlocked Users">
                <TabItem.Background>
                    <LinearGradientBrush EndPoint="0,1" StartPoint="0,0">
                        <GradientStop Color="#FFF0F0F0" Offset="0"/>
                        <GradientStop Color="#FF695757" Offset="1"/>
                    </LinearGradientBrush>
                </TabItem.Background>
                <Grid Background="#FF1B2545">
                    <ListBox x:Name="listBox" HorizontalAlignment="Left" Height="186" Margin="23,46,0,0" VerticalAlignment="Top" Width="379">
                        <ListView x:Name="listView" Height="176" Width="369">
                            <ListView.View>
                                <GridView>
                                    <GridViewColumn Header="UserName" DisplayMemberBinding ="{Binding 'Name'}" Width="120"/>
                                    <GridViewColumn Header="Email" DisplayMemberBinding ="{Binding 'UserPrincipalName'}" Width="120"/>
                                    <GridViewColumn Header="LockedOut" DisplayMemberBinding ="{Binding Size(MB)}" Width="120"/>

                                </GridView>
                            </ListView.View>
                        </ListView>
                    </ListBox>
                    <Label x:Name="Lockedlabel" Content="The following users are currently locked out" HorizontalAlignment="Left" Margin="25,12,0,0" VerticalAlignment="Top" Foreground="#FFF7EFEF"/>
                    <Button x:Name="Unlock" HorizontalAlignment="Left" Height="31" Margin="447,86,0,0" VerticalAlignment="Top" Width="126" Content="Unlock"/>
                        
                    <Button x:Name="Refresh" Content="Refresh List" HorizontalAlignment="Left" Height="35" Margin="447,46,0,0" VerticalAlignment="Top" Width="126"/>

                </Grid>
            </TabItem>
        </TabControl>

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
    $WPFRefresh.Add_Click({
        $WPFlistView.Items.Clear()
        Search-ADAccount -LockedOut  |% {$WPFlistView.AddChild($_)}
        }) 

    $WPFUnlock.Add_Click({
        $WPFlistView.SelectedItems | % {if ((Get-ADUser $_ | Unlock-ADAccount -PassThru) -ne $null){}}
    })

    #Adding code to a button, so that when clicked, it pings a system
    # $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
    # })
    #===========================================================================
    # Shows the form
    #===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
'$Form.ShowDialog() | out-null'
 
 $Form.ShowDialog() | out-null
 
 