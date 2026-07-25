## User Provisioning 
Users were provisioned in bulk from a CSV with a PowerShell script. This is faster for provisioning, easily-repeatable, and less error prone to doing it manually.

## The source data 
A CSV of 17 users were created - a mix of Breaking Bad / Better Call Saul characters and randomly-generated names. The columns in the CSV file are simple: `FirstName`, `LastName`, `Department`

The full file is ________________________. The `Department` value on each row must exactly match a sub-OU name under `SGA-Users` (`Partners`, `Associates`, `Paralegals`, `Administration`, `IT`). because that's how the script decides where to put each account. 

## The script
The full script is ________________________. For each row within the **for loop**, it:
- Builds a `sAMAccountName` as `FirstName` + `LastName`, lowercased
- Builds a UPN of `<sam>@sga.local` 
- Computes the target OU path from the `Department` field
- Creates the new account with `New-ADUser`, with a shared lab password

`
$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force
$users = Import-Csv -Path "C:\Users\saulgoodman\Documents\sga_users.csv"

foreach ($user in $users) {
    $samAccount = "$($user.FirstName.ToLower())$($user.LastName.ToLower())"
    $upn        = "$samAccount@sga.local"
    $ouPath     = "OU=$($user.Department),OU=SGA-Users,DC=sga,DC=local"

    New-ADUser `
        -Name              "$($user.FirstName) $($user.LastName)" `
        -GivenName         $user.FirstName `
        -Surname           $user.LastName `
        -SamAccountName    $samAccount `
        -UserPrincipalName $upn `
        -Path              $ouPath `
        -AccountPassword   $password `
        -Enabled           $true
}
`
## Verifying 

After running the code, confirm each account under `SGA-USERS`:
`Get-ADUser -Filter * -SearchBase "OU=SGA-Users,DC=sga,DC=local" |
 Select-Object Name, DistinguishedName`

## Notes
- All accounts share the same temporary password, `Password123!` which is never acceptable in a real environment.
    
