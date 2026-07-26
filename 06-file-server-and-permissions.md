## File Server and Permissions

A second Windows Server VM was created: a file server. This server exists to host the firm's shared folders. The server was immediately joined to the `sga.local` so that it could recieve access to relevant information. 

## Why domain-join the file server?

- The file server is essentially its own seperate server. It has no knowledge of the users created on the domain controller. 
- By **joining it to the domain** (`DC-01`), the file server creates a trust of the domain's users.

## Deploying the VM

A new Azure VM (`FILE-SERV01`) was created and connected to it via its public IP, the same way as the DC. 

**Creating the file server VM:**
<img width="1379" height="696" alt="Screenshot 2026-07-25 at 5 22 09 PM" src="https://github.com/user-attachments/assets/57f1a9e1-f8d1-4455-904e-6ca856aa80b9" />

## Pointing the file server at the domain's DNS

For domain-join to work, the file server has to resolve `sga.local`, which means the domain controller is to be used as its DNS server.

1. On the **domain controller**, get its IP address - `10.0.0.5`.
2. On the **file server**, set the DNS server to `10.0.0.5`.
  - `Control Panel -> Network and Internet -> Network and Sharing Center`
  - `Change Adapter Settings -> Ethernet -> Properties`
  - Double-click `Internet Protocol Version 4 (TCP/IPv4)`
  - Set the preferred DNS server to `10.0.0.5`
3. Confirm the DNS was set by running `ipconfig/all` on the file server.

**Getting the IP address on the domain controller:**
<img width="1817" height="1023" alt="Screenshot 2026-07-25 at 17-34-05" src="https://github.com/user-attachments/assets/f0df8851-4514-4cb2-95df-ba8a339deb6e" />

**Pointing the file server to the DC for DNS:**
<img width="915" height="544" alt="Screenshot 2026-07-25 at 5 36 10 PM" src="https://github.com/user-attachments/assets/887c3c4a-7aea-4514-82da-b9a53cb39d35" />

**Confirming DNS was set on file server:**
<img width="1578" height="1074" alt="Screenshot 2026-07-25 at 17-38-18" src="https://github.com/user-attachments/assets/7681d2c0-9665-44ca-86b7-663f7425c13e" />

## Virtual network peering

The DC and file server needed to reach each other across Azure networking, requiring **Virtual Network Peering** between their VNets. Once peered, the two servers could communicate and domain-join succeeded.

**Successful VNET pairing between the servers:**
<img width="2374" height="1208" alt="Screenshot 2026-07-25 at 17-40-58" src="https://github.com/user-attachments/assets/20c4bd28-105f-47d4-a628-eb4216e9e6c3" />

## Joining the domain

1. `Settings` -> `System` -> `Domain and Workgroup`
2. Enter the domain: `sga.local`

**Joining the file server to domain (1):**
<img width="1081" height="646" alt="Screenshot 2026-07-25 at 5 42 01 PM" src="https://github.com/user-attachments/assets/2f279829-5cef-44cc-bbaa-058bba4e075e" />

**Joining the file server to domain (2):**

You will be prompted to input your admin credentials
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 42 56 PM" src="https://github.com/user-attachments/assets/862408ed-c7a2-4c3e-af4a-b9e2f712d85d" />

**Joining the file server to domain (3):**

The file server has sucessfully been joined to the domain
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 43 46 PM" src="https://github.com/user-attachments/assets/5c30c102-b2dc-465d-8164-38870f8ca1fb" />

## Installing the File Server role

From Server Manager on `FILE-SERV01`:
1. `Add Roles and Features`-> `Next` -> `Next` -> `Next`
2. Under roles, expand `File and Storage Services`, then expand again make sure `File Server` is checked
3. Select `Next` -> `Install`

**Confirmation of roles on installation wizard:**
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 45 12 PM" src="https://github.com/user-attachments/assets/b446d208-7d7a-4a22-ac8e-208ef27c51c5" />


## Creating the shared folders
In File Explorer, create four folders on the **C:drive:**
- `CaseFiles`
- `Billing`
- `SharedDrive`
- `IT`

**Creation of shared folders:**
<img width="2429" height="1422" alt="Screenshot 2026-07-25 at 17-49-03" src="https://github.com/user-attachments/assets/1dba7357-6e9a-4873-a492-3c95c565c6b8" />

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


**CaseFiles Share Permissions:**
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 51 07 PM" src="https://github.com/user-attachments/assets/289dc2f2-0f05-4a55-ba78-0f3179809307" />

**Billing Share Permissions:**
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 51 44 PM" src="https://github.com/user-attachments/assets/6c2eddcd-3f9b-40ec-bb5e-ba2ac44cc621" />

**SharedDrive Share Permissions:**
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 52 19 PM" src="https://github.com/user-attachments/assets/069a83db-38ad-4cb8-a0a9-cb95c3686130" />

**IT Share Permissions:**
<img width="1081" height="648" alt="Screenshot 2026-07-25 at 5 52 40 PM" src="https://github.com/user-attachments/assets/c6d06247-6cc3-45af-b789-ad32d3da3660" />


