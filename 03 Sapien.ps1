﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: e003010b-d681-442d-b757-1cd31a20ec09
# Source File: UserAndComputerOU_tool.pff
#------------------------------------------------------------------------
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
SBkAAB+LCAAAAAAABADNWWFP8zYQ/j5p/8HKZ9aShlKQSiQoY0Jjg5Hybt+Qm15bD8fuHAfIfv3O
SVqSJm1dXloNJETOd77n7p7YZ6f/CKF8BZVeU039H38gpH+v2JQJym8Yh99pBP5TDOpSjAcymica
1P3Ts5aSt+aTSb9dU86mME/fQMVMCt9tdfrtsiB3MvobQk10OocLJ0hjDVHrTybG8i1u3UgV5X+P
SNPQESmmujhpHZvfIzJIuE4UXAhItKL8iDwkI87CXyEdyhcQF6Nej3bD7ql77p3A8dm5QwSCvXAm
OB9mgHJ+/zTEoBwSzhgfKzRxBlJoJXnsZIgR84OSc1A6LWwHnIHQAfsXHL/TOz8iXve8314orTEy
OXL8VbdbzYbwrh0/NyH3T6TZ6OdXBFRY3Ek6rjt6NuJ+O1Nssgpm8k00mGXyFbvtJbyjI+B7r+G1
jCgTWC2BcHDGzOumQtbTi5BgILlUjn8N8YuW81py60Z3MqTGn+O7bg+r3zm2MMrr3wjZwjonm+th
ttyehf6Qjm7FGN4dv2ujnZFsgUpMiZZknCFttVp1trVzAtjTIdBUJ3GgFZvvnRRx5is2vtzduHCL
sErDqGAkm+Iyb0gWVR7gnllfQobYHmECGFgIBXqzMmdR5wngBgsmoF2Op20C+oh/F6YjYM+zYV7O
83IVrOmdraWdzk70PrGm92z5sxHc7uy+SrSWYu/EHmVuAqAqnO1G7NJ61etghs9OretYdmpdx14X
nXg7ldFKOyujNRZsXr6xOKH4hqYcrmj4Uiz0Q5VAk315O8QtPnyphv+cyVa2wv83WW7Yu5mY6k/z
xfsMXZZu98kYq2UiYwzCIdZ4vo41yyx8DXEeWTgz8VzJ972zR6Evjb5G8n3HPbRKna59Y1R2ab9h
eCeGNzZePohjM31OnE0bZbnsRnswo2IK42ogz6WR763/YVrqrG3Ad2A4Y7HpbobyjwTJy9PvoYFr
82bnNFjrf4cmAjnhWbUFS0pYESijBEIjGrER026ZNvmfHB7BkzSbpDgGhBfBEzkhCZ6gYyIVCYsz
dEyYyLSKI10gE4U9XH4usFxf1iZp60pTfdhOusM2uBs72Y3H6kaTrWfrnDDnncYz1bozUoLVwMIa
YbxiVM3uZRxDhAFDvJixkKR+kcDfqKBTiLBWrctEIwMMaz4S6dom0nNHE++se0rH3ukJeHjiW3pa
9RzFoVScjb6gXBu85PEdwseXk3C7R3NfdhhHir7hYfwzvo69SXfSm7juuHtMPbrd118RP0xMTOEL
IlUagHplIXyqZDtHN5AKDhJeERWuChjaYWK7hphNxde7Wj4uFrD+AzbDuF6pBZJfQABOXNoxc4Xl
bXDROzVJC+FtWFwLV1SrUlwl2QRiPVCQLZCmgavJltqDJMaVdDFemnvdwAOn2tx6+j+ZDWPxsBx+
TEQwvDQdQvHfh6F8AxXMgPPF/bY5ktSEi124mq1+AGGiGO4uiwuaftWgdpeeVbV+n77YqsZJqGvK
K/JV/dVCNUmRXiHuq9Uktxul5jMBFWk556uSgZynik1nlcLUZbcCOyVB+QrAZnHjh4jcYP0QIos+
eqQCa1TumiofLdol7iMTyl9O/gOxqh1lSBkAAA==#>
#endregion
#========================================================================
# Code Generated By: SAPIEN Technologies, Inc., PowerShell Studio 2012 v3.1.34
# Generated On: 6/10/2014 3:14 PM
# Generated By: sowen
#========================================================================
#----------------------------------------------
#region Application Functions
#----------------------------------------------

function OnApplicationLoad {
	#Note: This function is not called in Projects
	#Note: This function runs before the form is created
	#Note: To get the script directory in the Packager use: Split-Path $hostinvocation.MyCommand.path
	#Note: To get the console output in the Packager (Windows Mode) use: $ConsoleOutput (Type: System.Collections.ArrayList)
	#Important: Form controls cannot be accessed in this function
	#TODO: Add snapins and custom code to validate the application load
	#add-pssnapin Quest.ActiveRoles.ADManagement
	#$cred = (Get-credential  -Message "Enter your credentials for the Client Domain" )
	
	return $true #return true for success or false for failure
}

function OnApplicationExit {
	#Note: This function is not called in Projects
	#Note: This function runs after the form is closed
	#TODO: Add custom code to clean up and unload snapins when the application exits
	
	$script:ExitCode = 0 #Set the exit code for the Packager
}

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Call-UserAndComputerOU_tool_pff {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load("mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
	[void][reflection.assembly]::Load("System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
	[void][reflection.assembly]::Load("System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")
	[void][reflection.assembly]::Load("System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
	[void][reflection.assembly]::Load("System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formClientOUTool = New-Object 'System.Windows.Forms.Form'
	$DomainConnectionLabel = New-Object 'System.Windows.Forms.Label'
	$statusstrip1 = New-Object 'System.Windows.Forms.StatusStrip'
	$buttonSearch = New-Object 'System.Windows.Forms.Button'
	$buttonFixFormat = New-Object 'System.Windows.Forms.Button'
	$richtextbox1 = New-Object 'System.Windows.Forms.RichTextBox'
	$labelUseThisToolToQuickly = New-Object 'System.Windows.Forms.Label'
	$toolstripstatuslabel1 = New-Object 'System.Windows.Forms.ToolStripStatusLabel'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	
	
	
	
	
	
	$formClientOUTool_Load={
		#TODO: Initialize Form Controls here
		
	}
	
	$labelUseThisToolToQuickly_Click={
		#TODO: Place custom script here
		
	}
	
	$buttonFixFormat_Click={
		#TODO: Place custom script here
			"When clicked, I should parse out the contents of the textbox"
			$names = $richtextbox1.Text
			
			Write-Debug $names
	        if ($names -contains ',') {
	            Write-Debug "A comma was found, splitting on commas"
	            $names = $names.Split(',')
	            $names | % {Write-Debug $_}
	            Write-Debug ("Total Names Detected: " + $names.Count)
	            }
	        ELSE{
	            Write-Debug "No commas found, splitting on Host.Newline"
	            $names = $names.Split([environment]::NewLine)
	            $names | % {Write-Debug $_}
	            Write-Debug ("Total Names Detected: " + $names.Count)
	            }
	
	            $richtextbox1.Text = $names
				$toolstripstatuslabel1.Text = ("Count of names: " + $names.Count)
	}
	
	$richtextbox1_TextChanged={
		#TODO: Place custom script here
		$names = $richtextbox1.Text
		$toolstripstatuslabel1.Text = ("Count of names: " + $names.Count)
	}
	
	$buttonSearch_Click={
		#TODO: Place custom script here
		$names | Get-qadObject | select Name, DN | Out-GridView
	}
	
	$formClientOUTool_Shown={
		#TODO: Place custom script here
		Connect-QADService -Service amatldc00.Clientad.Client.com -Credential $cred 
		
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formClientOUTool.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonSearch.remove_Click($buttonSearch_Click)
			$buttonFixFormat.remove_Click($buttonFixFormat_Click)
			$richtextbox1.remove_TextChanged($richtextbox1_TextChanged)
			$labelUseThisToolToQuickly.remove_Click($labelUseThisToolToQuickly_Click)
			$formClientOUTool.remove_Load($formClientOUTool_Load)
			$formClientOUTool.remove_Shown($formClientOUTool_Shown)
			$formClientOUTool.remove_Load($Form_StateCorrection_Load)
			$formClientOUTool.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	#
	# formClientOUTool
	#
	$formClientOUTool.Controls.Add($DomainConnectionLabel)
	$formClientOUTool.Controls.Add($statusstrip1)
	$formClientOUTool.Controls.Add($buttonSearch)
	$formClientOUTool.Controls.Add($buttonFixFormat)
	$formClientOUTool.Controls.Add($richtextbox1)
	$formClientOUTool.Controls.Add($labelUseThisToolToQuickly)
	$formClientOUTool.ClientSize = '279, 359'
	$formClientOUTool.Name = "formClientOUTool"
	$formClientOUTool.Text = "Client OU Tool"
	$formClientOUTool.add_Load($formClientOUTool_Load)
	$formClientOUTool.add_Shown($formClientOUTool_Shown)
	#
	# DomainConnectionLabel
	#
	$DomainConnectionLabel.ForeColor = 'Desktop'
	$DomainConnectionLabel.Location = '117, 320'
	$DomainConnectionLabel.Name = "DomainConnectionLabel"
	$DomainConnectionLabel.Size = '130, 17'
	$DomainConnectionLabel.TabIndex = 5
	$DomainConnectionLabel.Text = "Connecting to domain..."
	#
	# statusstrip1
	#
	[void]$statusstrip1.Items.Add($toolstripstatuslabel1)
	$statusstrip1.Location = '0, 337'
	$statusstrip1.Name = "statusstrip1"
	$statusstrip1.Size = '279, 22'
	$statusstrip1.TabIndex = 4
	$statusstrip1.Text = "hhhhhhhhhhstatusstrip1"
	#
	# buttonSearch
	#
	$buttonSearch.Location = '172, 286'
	$buttonSearch.Name = "buttonSearch"
	$buttonSearch.Size = '75, 23'
	$buttonSearch.TabIndex = 3
	$buttonSearch.Text = "Search"
	$buttonSearch.UseVisualStyleBackColor = $True
	$buttonSearch.add_Click($buttonSearch_Click)
	#
	# buttonFixFormat
	#
	$buttonFixFormat.Location = '13, 286'
	$buttonFixFormat.Name = "buttonFixFormat"
	$buttonFixFormat.Size = '75, 23'
	$buttonFixFormat.TabIndex = 2
	$buttonFixFormat.Text = "Fix Format"
	$buttonFixFormat.UseVisualStyleBackColor = $True
	$buttonFixFormat.add_Click($buttonFixFormat_Click)
	#
	# richtextbox1
	#
	$richtextbox1.Location = '13, 50'
	$richtextbox1.Name = "richtextbox1"
	$richtextbox1.Size = '234, 230'
	$richtextbox1.TabIndex = 1
	$richtextbox1.Text = ""
	$richtextbox1.add_TextChanged($richtextbox1_TextChanged)
	#
	# labelUseThisToolToQuickly
	#
	$labelUseThisToolToQuickly.Location = '13, 13'
	$labelUseThisToolToQuickly.Name = "labelUseThisToolToQuickly"
	$labelUseThisToolToQuickly.Size = '274, 34'
	$labelUseThisToolToQuickly.TabIndex = 0
	$labelUseThisToolToQuickly.Text = "Use this tool to quickly verify the location of users or computers in the Client Source Domain"
	$labelUseThisToolToQuickly.add_Click($labelUseThisToolToQuickly_Click)
	#
	# toolstripstatuslabel1
	#
	$toolstripstatuslabel1.Name = "toolstripstatuslabel1"
	$toolstripstatuslabel1.Size = '92, 17'
	$toolstripstatuslabel1.Text = "Count of names"
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formClientOUTool.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formClientOUTool.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formClientOUTool.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formClientOUTool.ShowDialog()

} #End Function

#Call OnApplicationLoad to initialize
if((OnApplicationLoad) -eq $true)
{
	#Call the form
	Call-UserAndComputerOU_tool_pff | Out-Null
	#Perform cleanup
	OnApplicationExit
}