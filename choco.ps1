#! MUST RUN WITH POWERSHELL AS ADMINISTRATOR !#

# Change execution policy
Set-ExecutionPolicy Bypass -Scope Process 
# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Display installed chocolatey version
choco -v
# Install choco packages from config file
choco install ./choco.config