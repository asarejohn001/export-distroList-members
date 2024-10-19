# Distribution group
Distributions group that can be used only to distribute messages. Distribution groups are best for situations where you need to broadcast information to a set group of people, such as "People in Building A" or "Everyone at Contoso." Learn more about distribution from the [Microsoft's documentation](https://learn.microsoft.com/en-us/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide#distribution-groups).

# About the script
The [script](export-members-from-distroList.ps1) will help engineers and administrators export distribution group members.

## Step-by-step
1. It will import the REST API [ExchangeOnlineManagement module](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps#rest-api-connections-in-the-exo-v3-module)
2. Uses the [Connect-ExchangeOnline](https://learn.microsoft.com/en-us/powershell/module/exchange/connect-exchangeonline?view=exchange-ps) method to connect to your exchange admin console (EAC).
3. Uses the [Get-DistributionGroupMember](https://learn.microsoft.com/en-us/powershell/module/exchange/get-distributiongroupmember?view=exchange-ps) to export distribution group members. It will export the member's DisplayName and PrimarySmtpAddress into a CSV file.

# Important
> [!IMPORTANT]
> Please make sure to change the value of these variables to your environment: $logFilePath, $distributionGroup, and $csvPath.
