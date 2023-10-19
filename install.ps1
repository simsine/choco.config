#! MUST RUN WITH POWERSHELL AS ADMINISTRATOR !#
#Requires -RunAsAdministrator

$yes = "y", "Y", "yes", "YES", "Yes"

Write-Output "Checking if chocolatey is installed..."
try {
    # Check if chocolatey is installed correctly
    choco.exe --verbose
    Write-Output "Chocolatey is installed."
}catch{
    # Conclude chocolatey is not installed
    Write-Output "Chocolatey is not installed, attempting install"
    try{
        # Attempt to install chocolatey
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }catch{
        Write-Output "Failed to install chocolatey, exiting"
        Exit
    }
    # Display installed chocolatey version
    choco.exe --verbose
}

$prompt = Read-Host -Prompt "Do you wish to install the packages listed in the choco.config file? | y/N"
if ($yes -contains $prompt) {
    Write-Output "Installing all packages. This might take a while"
    # Install choco packages from config file
    choco.exe install .\config\chocolatey\choco.config
}else{
    Write-Output "Did not install chocolatey packages.\n"
}

$prompt = Read-Host -Prompt "Do you wish to install the nerd-font provided? | y/N"
if ($yes -contains $prompt) {
    # Open prompt to install nerdfont
    Invoke-Item .\config\font\CaskaydiaCove-Regular.ttf
}

$prompt = Read-Host -Prompt "Do you wish to use the provided powershell profile containting oh-my-posh and terminal-icons? | y/N"
if ($yes -contains $prompt) {
    # Copy powershell profile
    Copy-Item -Path ".\config\pwsh\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
}

$prompt = Read-Host -Prompt "Do you wish to use the provided winfetch configs? | y/N"
if ($yes -contains $prompt) {
    # Copy winfetch config
    Copy-Item -Path ".\config\winfetch\config.ps1" -Destination (New-item -Name "winfetch" -Type Directory -Path "~\.config\")
}