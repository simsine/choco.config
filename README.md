# choco.config

This repo contains a PowerShell script that installs the chocolatey package manager and then installs the packages specified in the `./config/choco.config` file.

Feel free to edit the config file for own use.

## How to use

Simply run the `install.ps1` file in a PowerShell terminal with adiministrator permissions.

The script will first check if chocolatey is installed and attempt to install it if not.

It will then proceed to install the selected packages.
