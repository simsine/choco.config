#! MUST RUN WITH POWERSHELL AS ADMINISTRATOR !#

Write-Output "Checking if chocolatey is installed..."
try {
    # Check for chocolatey installation
    choco.exe
    Write-Output "Chocolatey is installed."
}
catch{
    Write-Output "Chocolatey is not installed, attempting install..."

    # Change execution policy and install chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    # Display installed chocolatey version
    choco.exe
}

$prompt = Read-Host -Prompt "Do you wish to install the packages listed in the choco.config file? | [y]es / [n]o"
if ($prompt -eq "y") {
    # Install choco packages from config file
    choco.exe install .\config\choco.config
}else{
    Write-Output "Install canceled, exiting."
}