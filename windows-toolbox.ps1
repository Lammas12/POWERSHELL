Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ComboBoxObject = [System.Windows.Forms.ComboBox]
$ButtonObject = [System.Windows.Forms.Button]
$CheckBoxObject = [System.Windows.Forms.CheckBox]
$TabControlObject = [System.Windows.Forms.TabControl]
$GroupBoxObject = [System.Windows.Forms.GroupBox]
$Font = New-Object System.Drawing.Font("Helvetica", 10)

# Vormi koostamine
$AppForm = New-Object $FormObject
$AppForm.ClientSize = '800,500'
$AppForm.Text = 'Füürer - TOOLBOX'
$AppForm.BackColor = '#ffffff'
$AppForm.Font = $Font

# TAB-I KONTROLLER???
$tabControl = New-Object $TabControlObject
$tabControl.Size = New-Object System.Drawing.Size(780, 400)
$tabControl.Location = New-Object System.Drawing.Point(10, 10)
$AppForm.Controls.Add($tabControl)

# Tab1 - Install
$tabPage1 = New-Object System.Windows.Forms.TabPage
$tabPage1.Text = "TARKVARA"
$tabControl.Controls.Add($tabPage1)

# Winget GroupBox
$WingetGroupBox = New-Object $GroupBoxObject
$WingetGroupBox.Text = "TARKVARAD"
$WingetGroupBox.Location = New-Object System.Drawing.Point(10, 50)
$WingetGroupBox.Size = New-Object System.Drawing.Size(530, 350)
$WingetGroupBox.Font = $Font
$tabPage1.Controls.Add($WingetGroupBox)

# Install Button
$InstallButton = New-Object $ButtonObject
$InstallButton.Text = "Installi"
$InstallButton.Location = New-Object System.Drawing.Point(190, 20)
$InstallButton.Size = New-Object System.Drawing.Size(150, 30)
$InstallButton.Font = $Font
$WingetGroupBox.Controls.Add($InstallButton)
$InstallButton.Add_Click({
    if ($BrowserButton1.Checked) { ChromeInstall }
    if ($BrowserButton2.Checked) { FirefoxInstall }
    if ($BrowserButton3.Checked) { BraveInstall }
    if ($ArendajaButton1.Checked) { GitHubInstall }
    if ($ArendajaButton2.Checked) { GitInstall }
    if ($ArendajaButton3.Checked) { VSCodeInstall }
    if ($MuuButton1.Checked) { 7zipInstall }

})

# UUENDAJA/VÄRSKENDAJA
$UpgradeButton = New-Object $ButtonObject
$UpgradeButton.Text = "Uuenda kõik"
$UpgradeButton.Location = New-Object System.Drawing.Point(359, 20)
$UpgradeButton.Size = New-Object System.Drawing.Size(150, 30)
$UpgradeButton.Font = $Font
$WingetGroupBox.Controls.Add($UpgradeButton)
$UpgradeButton.Add_Click({UpgradeAll})

function UpgradeAll {
    Start-Process "winget" -ArgumentList "upgrade --all" -Wait
}

# Browsers GroupBox
$BrowserGroupBox = New-Object $GroupBoxObject
$BrowserGroupBox.Text = "Chrome ja asjad"
$BrowserGroupBox.Location = New-Object System.Drawing.Point(21, 60)
$BrowserGroupBox.Size = New-Object System.Drawing.Size(150, 278)
$BrowserGroupBox.Font = $Font
$WingetGroupBox.Controls.Add($BrowserGroupBox)

# Browsers CheckBoxes
$BrowserButton1 = New-Object $CheckBoxObject
$BrowserButton1.Text = "Chrome"
$BrowserButton1.Location = New-Object System.Drawing.Point(20, 30)
$BrowserButton1.Font = $Font
$BrowserGroupBox.Controls.Add($BrowserButton1)
function ChromeInstall {
    Start-Process "winget" -ArgumentList "install Google.Chrome" -Wait
}

$BrowserButton2 = New-Object $CheckBoxObject
$BrowserButton2.Text = "Firefox"
$BrowserButton2.Location = New-Object System.Drawing.Point(20, 60)
$BrowserButton2.Font = $Font
$BrowserGroupBox.Controls.Add($BrowserButton2)
function FirefoxInstall {
    Start-Process "winget" -ArgumentList "install Mozilla.Firefox" -Wait
}

$BrowserButton3 = New-Object $CheckBoxObject
$BrowserButton3.Text = "Brave"
$BrowserButton3.Location = New-Object System.Drawing.Point(20, 90)
$BrowserButton3.Font = $Font
$BrowserGroupBox.Controls.Add($BrowserButton3)
function BraveInstall {
    Start-Process "winget" -ArgumentList "install Brave.Brave" -Wait
}


# Gruopbox AREANDAJALE 
$ArendajaGroupBox = New-Object $GroupBoxObject
$ArendajaGroupBox.Text = "Arendajale"
$ArendajaGroupBox.Location = New-Object System.Drawing.Point(190, 60)
$ArendajaGroupBox.Size = New-Object System.Drawing.Size(150, 278)
$ArendajaGroupBox.Font = $Font
$WingetGroupBox.Controls.Add($ArendajaGroupBox)

$ArendajaButton1 = New-Object $CheckBoxObject
$ArendajaButton1.Text = "GitHub Desktop"
$ArendajaButton1.Size = New-Object System.Drawing.Size(120, 40)
$ArendajaButton1.Location = New-Object System.Drawing.Point(20, 20)
$ArendajaButton1.Font = $Font
$ArendajaGroupBox.Controls.Add($ArendajaButton1)
function GitHubInstall {
    Start-Process "winget" -ArgumentList "install GitHub.GitHubDesktop" -Wait
}

$ArendajaButton2 = New-Object $CheckBoxObject
$ArendajaButton2.Text = "Git"
$ArendajaButton2.Location = New-Object System.Drawing.Point(20, 60)
$ArendajaButton2.Font = $Font
$ArendajaGroupBox.Controls.Add($ArendajaButton2)
function GitInstall {
    Start-Process "winget" -ArgumentList "install Git.Git" -Wait
}

$ArendajaButton3 = New-Object $CheckBoxObject
$ArendajaButton3.Text = "VS Code"
$ArendajaButton3.Size = New-Object System.Drawing.Size(120, 40)
$ArendajaButton3.Location = New-Object System.Drawing.Point(20, 80)
$ArendajaButton3.Font = $Font
$ArendajaGroupBox.Controls.Add($ArendajaButton3)
function VSCodeInstall {
    Start-Process "winget" -ArgumentList "install Microsoft.VisualStudioCode" -Wait
}

# Muu GroupBox
$MuuGroupBox = New-Object $GroupBoxObject
$MuuGroupBox.Text = "Muu"
$MuuGroupBox.Location = New-Object System.Drawing.Point(359, 60)
$MuuGroupBox.Size = New-Object System.Drawing.Size(150, 278)
$MuuGroupBox.Font = $Font
$WingetGroupBox.Controls.Add($MuuGroupBox)

# Muu CheckBox-id
$MuuButton1 = New-Object $CheckBoxObject
$MuuButton1.Text = "7-Zip"
$MuuButton1.Location = New-Object System.Drawing.Point(20, 25)
$MuuButton1.Font = $Font
$MuuGroupBox.Controls.Add($MuuButton1)
function 7zipInstall {
    Start-Process "winget" -ArgumentList "install 7zip.7zip" -Wait
}


# Tab2 - Teenused
$tabPage2 = New-Object System.Windows.Forms.TabPage
$tabPage2.Text = "Teenused"
$tabControl.Controls.Add($tabPage2)

# Labels for Service Details
$lblService = New-Object $LabelObject
$lblService.Text = 'Teenused:'
$lblService.AutoSize = $true
$lblService.Location = New-Object System.Drawing.Point(20, 20)
$tabPage2.Controls.Add($lblService)

$ddlService = New-Object $ComboBoxObject
$ddlService.Width = '300'
$ddlService.Location = New-Object System.Drawing.Point(125, 20)

# Load the drop down list for services
Get-Service | ForEach-Object { $ddlService.Items.Add($_.Name) }
$ddlService.SelectedIndex = 0
$tabPage2.Controls.Add($ddlService)

$lblForName = New-Object $LabelObject
$lblForName.Text = 'Teenuse nimi :'
$lblForName.AutoSize = $true
$lblForName.Location = New-Object System.Drawing.Point(20, 80)
$tabPage2.Controls.Add($lblForName)

$lblName = New-Object $LabelObject
$lblName.Text = ''
$lblName.AutoSize = $true
$lblName.Location = New-Object System.Drawing.Point(240, 80)
$tabPage2.Controls.Add($lblName)

$lblForStatus = New-Object $LabelObject
$lblForStatus.Text = 'Olek :'
$lblForStatus.AutoSize = $true
$lblForStatus.Location = New-Object System.Drawing.Point(20, 120)
$tabPage2.Controls.Add($lblForStatus)

$lblStatus = New-Object $LabelObject
$lblStatus.Text = ''
$lblStatus.AutoSize = $true
$lblStatus.Location = New-Object System.Drawing.Point(240, 120)
$tabPage2.Controls.Add($lblStatus)

# Function to get service details
function Get-ServiceDetails {
    $ServiceName = $ddlService.SelectedItem
    Write-Host "Teenuse nimi : $ServiceName"
    $details = Get-Service -Name $ServiceName | Select-Object -Property Name, Status

    if ($details) {
        $lblName.Text = $details.Name
        $lblStatus.Text = $details.Status

        if ($lblStatus.Text -eq 'Running') {
            $lblStatus.ForeColor = 'green'
        } else {
            $lblStatus.ForeColor = 'red'
        }
    } else {
        $lblName.Text = "Teenust '$ServiceName' ei leitud."
        $lblStatus.Text = ''
        $lblStatus.ForeColor = 'black'
    }
}

# Event handler for ComboBox selection change
$ddlService.Add_SelectedIndexChanged({ Get-ServiceDetails })

# Tab3 - POWWERR
$tabPage3 = New-Object System.Windows.Forms.TabPage
$tabPage3.Text = "Power"
$tabControl.Controls.Add($tabPage3)

$POWER1 = New-Object System.Windows.Forms.Button
$POWER1.Location = New-Object System.Drawing.Point(10,50)
$POWER1.Size = New-Object System.Drawing.Size(320,25)
$POWER1.Text = "Restart"
$POWER1.add_click({shutdown /r})
$tabPage3.Controls.add($POWER1)

$POWER2 = New-Object System.Windows.Forms.Button
$POWER2.Location = New-Object System.Drawing.Point(10,75)
$POWER2.Size = New-Object System.Drawing.Size(320,25)
$POWER2.Text = "Shutdown"
$POWER2.add_click({shutdown /s})
$tabPage3.Controls.add($POWER2  )

$POWER3 = New-Object System.Windows.Forms.Button
$POWER3.Location = New-Object System.Drawing.Point(10,100)
$POWER3.Size = New-Object System.Drawing.Size(320,25)
$POWER3.Text = "Abort"
$POWER3.add_click({shutdown /a})
$TabPage3.Controls.add($POWER3)

$POWER4 = New-Object System.Windows.Forms.Button
$POWER4.Location = New-Object System.Drawing.Point(10,125)
$POWER4.Size = New-Object System.Drawing.Size(320,25)
$POWER4.Text = "Force Reboot"
$POWER4.add_click({shutdown /r /f})
$tabPage3.Controls.add($POWER4)

$POWER5 = New-Object System.Windows.Forms.Button
$POWER5.Location = New-Object System.Drawing.Point(10,150)
$POWER5.Size = New-Object System.Drawing.Size(320,25)
$POWER5.Text = "Force Shutdown"
$POWER5.add_click({shutdown /s /f})
$tabPage3.Controls.add($POWER5)

$POWER6 = New-Object System.Windows.Forms.Button
$POWER6.Location = New-Object System.Drawing.Point(10,175)
$POWER6.Size = New-Object System.Drawing.Size(320,25)
$POWER6.Text = "Log Out"
$POWER6.add_click({shutdown /l})
$tabPage3.Controls.add($POWER6) 


# Tab4 - Jah
$tabPage4 = New-Object System.Windows.Forms.TabPage
$tabPage4.Text = "CLI"
$tabControl.Controls.Add($tabPage4)

    # Tekstisisestusala skripti sisendiks
    $inputBox = New-Object System.Windows.Forms.TextBox
    $inputBox.Size = New-Object System.Drawing.Size(560, 20)
    $inputBox.Location = New-Object System.Drawing.Point(10, 10)
    $tabPage4.Controls.Add($inputBox)

    # Tekstikast CLI väljundiks
    $outputBox = New-Object System.Windows.Forms.TextBox
    $outputBox.Multiline = $true
    $outputBox.ScrollBars = "Vertical"
    $outputBox.Size = New-Object System.Drawing.Size(560, 300)
    $outputBox.Location = New-Object System.Drawing.Point(10, 70)
    $outputBox.ReadOnly = $true
    $tabPage4.Controls.Add($outputBox)

    
    $runButton = New-Object System.Windows.Forms.Button
    $runButton.Size = New-Object System.Drawing.Size(75, 23)
    $runButton.Location = New-Object System.Drawing.Point(495, 35)
    $runButton.Text = "Käivita"
    $runButton.Add_Click({
        $scriptInput = $inputBox.Text

        # Näide: Käivita sisestatud käsk ja saada väljund tekstikasti
        try {
            $output = Invoke-Expression $scriptInput
            $outputBox.AppendText("$output`r`n")
        } catch {
            $outputBox.AppendText("Viga: $_`r`n")
        }
    })
    
    $tabPage4.Controls.Add($runButton)



# Tab5 - Nupud

$tabPage5 = New-Object System.Windows.Forms.TabPage
$tabPage5.Text = "Nupud"
$tabControl.Controls.Add($tabPage5)

# Hyper V

$nupp1 = New-Object System.Windows.Forms.Button
$nupp1.Location = New-Object System.Drawing.Point(10,50)
$nupp1.Size = New-Object System.Drawing.Size(320,25)
$nupp1.Text = "Hyper V lubamine/paigaldamine"
$nupp1.add_click({Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All})
$tabPage5.Controls.add($nupp1)

# Prügikasti tühjendamine

$nupp2 = New-Object System.Windows.Forms.Button
$nupp2.Location = New-Object System.Drawing.Point(10,75)
$nupp2.Size = New-Object System.Drawing.Size(320,25)
$nupp2.Text = "Prügikasti tühjendamine"
$nupp2.add_click({Clear-RecycleBin -Force})
$tabPage5.Controls.add($nupp2)


# 







# Näitab vormi
$AppForm.ShowDialog()

# Puhastab ära
$AppForm.Dispose()

