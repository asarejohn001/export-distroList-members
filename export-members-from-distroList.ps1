<#
Name: John Asare
Date: 08/29/2024

Desc: Ream more about this script from 
#>

# Install Exchange Online module if not already
Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber

# Import Exchange Online Management module
Import-Module ExchangeOnlineManagement

# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName 'enter your UPN'

# Function to log messages
function Get-Log {
    param (
        [string]$LogFilePath,
        [string]$LogMessage
    )
    # Create the log entry with the current date and time
    $logEntry = "{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $LogMessage
    # Append the log entry to the log file
    Add-Content -Path $LogFilePath -Value $logEntry
}
