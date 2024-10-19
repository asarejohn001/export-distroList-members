<#
Name: John Asare
Date: 08/29/2024

Desc: Ream more about this script from https://github.com/asarejohn001/export-distroList-members/edit/main/export-members-from-distroList.ps1
#>

# Install Exchange Online module if not already
#Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber

# Import Exchange Online Management module
Import-Module ExchangeOnlineManagement

# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName 'upn'

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

# Define the log file path
$logFilePath = ".\log.txt"

# Define the distribution group you want to export members from
$distributionGroup = "enter dl name"

# Specify the path where the CSV file will be saved
$csvPath = ".\DistributionGroupMembers.csv"

# Directly retrieve and export the members to a CSV file
try {
    Write-Host 'Script in-progress...'
    Get-DistributionGroupMember -Identity $distributionGroup -ResultSize Unlimited |
    Select-Object DisplayName,PrimarySmtpAddress |
    Export-Csv -Path $csvPath -NoTypeInformation
    
    Get-Log -LogFilePath $logFilePath -LogMessage "Successfully exported members to $csvPath"
    Write-Host "Members have been successfully exported to $csvPath" -ForegroundColor Green
}
catch {
    Get-Log -LogFilePath $logFilePath -LogMessage "Failed to export members to $csvPath. Error: $_"
    Write-Host "Failed to export members. See log for details." -ForegroundColor Red
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
