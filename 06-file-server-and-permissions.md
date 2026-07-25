## File Server and Permissions

A second Windows Server VM was created: a file server. This server exists to host the firm's shared folders. The server was immediately joined to the `sga.local` so that it could recieve access to relevant information. 

## Why domain-join the file server?

- The file server is essentially its own seperate server. It has no knowledge of the users created on the domain controller. 
- By **joining it to the domain** (`DC-01`), the file server creates a trust of the domain's users.

## Deploying the VM

A new Azure VM (`FILE-SERV01`) was created and connected to it via its public IP, the same way as the DC. 

## Pointing the file server at the domain's DNS

For domain-join to work, the file server has to resolve `sga.local`, which means the domain controller is to be used as its DNS server.

1. On the **domain controller**, get its IP address - `10.0.0.5`.
2. On the **file server**, set the DNS server to `10.0.0.5`.
  - `Control Panel` -> `Network and Internet` -> `Network and Sharing Center`
  - `Change Adapter Settings` -> `Ethernet` -> `Properties`
  - Double-click `Internet Protocol Version 4 (TCP/IPv4)`
  - Set the preferred DNS server to `10.0.0.5`
3. Confirm the DNS was set by running `ipconfig/all` on the file server.

## Virtual network peering

The DC and file server needed to reach each other across Azure networking, requiring **Virtual Network Peering** between their VNets. Once peered, the two servers could communicate and domain-join succeeded.

## Joining the domain

1. `Settings` -> `System` -> `Domain and Workgroup`
2. Enter the domain: `sga.local`

## Installing the File Server role

From Server Manager on `FILE-SERV01`:
1. `Add Roles and Features`-> `Next` -> `Next` -> `Next`
2. Under roles, expand `File and Storage Services`, then expand again make sure `File Server` is checked
3. Select `Next` -> `Install`

## Creating the shared folders
In File Explorer, create four folders on the **C:drive:**
- `CaseFiles`
- `Billing`
- `SharedDrive`
- `IT`

## Assigning permissions by security group
For each folder: Properties -> Sharing tab -> Advanced Sharing -> Share this folder -> Permissions, then remove `Everyone` and add the appropriate security groups. You will most likely be prompted for admin credentials. 

| Folder        | Security group      | Permission
|---------------|---------------------|-----------------|
|**CaseFiles**  | `SG-PARTNERS`       | Full Control    |
|               | `SG-ASSOCIATES`     | Change          |   
|               | `SG-PARALEGALS`     | Read            |
|**Billing**    | `SG-PARTNERS`       | Full Control    |
|               | `SG-ADMIN`          | Change          |
|**SharedDrive**| `SG-PARTNERS`       | Change          |
|               | `SG-ASSOCIATES`     | Change          |
|               | `SG-PARALEGALS`     | Change          |
|               | `SG-ADMIN`          | Change          |
|               | `SG-IT`             | Full Control    |
|**IT**         | `SG-IT`             | Full Control    |
