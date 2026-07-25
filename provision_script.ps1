$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force        
$users = Import-Csv -Path "C:\Users\saulgoodman\Documents\sga_users.csv"

foreach ($user in $users) {
    $samAccount = "$($user.FirstName.ToLower())$($user.LastName.ToLower())"
    $upn = "$samAccount@sga.local"
    $ouPath = "OU=$($user.Department),OU=SGA-Users,DC=sga,DC=local"
    
    New-ADUser `
        -Name "$($user.FirstName) $($user.LastName)" `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $samAccount `
        -UserPrincipalName $upn `
        -Path $ouPath `
        -AccountPassword $password `
        -Enabled $true
