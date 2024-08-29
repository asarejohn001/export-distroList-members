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
