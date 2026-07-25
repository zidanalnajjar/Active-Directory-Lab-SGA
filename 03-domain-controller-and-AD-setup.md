## Domain Controller and Active Directory

After ensuring the Windows Server VM becomes reachable over RDP, the next step was to install the Active Directory Domain Services, promote the server to a domain controller, to build out the OU structure. 

## Installing AD DS

From Server Manager:
1. Add **Roles and Features**
2. Click **Next**
3. Choose **Role-based or feature-based installation**, then next
4. Select **Active Directory Domain Services** (AD DS)
5. Click **Next** through the remaining screens
6. Click **Install**

**AD Installation Wizard confirmation screen**
<img width="1240" height="721" alt="Screenshot 2026-07-25 at 5 04 58 PM" src="https://github.com/user-attachments/assets/29ffca70-167b-407d-a23c-212bd1512040" />

## Promoting domain controller

After the role installs, Server Manager shows a yellow triangle notification to complete the promotion.
1. Click the yellow triangle notificaiton.
2. Select **Add a new forest**
3. Set the root domain name to `sga.local` (Saul Goodman and Associates)
4. Leave the forest/domain functional levels at their defaults
5. Set a **Directory Services Restore Mode (DSRM) password.
6. Leave the remaining screens (DNS options, NetBIOS name, paths) at their defaults.
7. On the prerequistes check, the yellow warnings could be ignored so long as you see **"All prerequisite checks passed sucessfully"** 
8. Click **Install**. The server will restart automatically when the promotion completes. 

Now, this Windows server is set as the domain controller for `sga.local`.

**Notification message:**
<img width="970" height="293" alt="Screenshot 2026-07-25 at 5 06 28 PM" src="https://github.com/user-attachments/assets/59c44072-bdb7-4235-a287-7c4308e82130" />

**AD Domain Services configuration wizard:**
<img width="970" height="531" alt="Screenshot 2026-07-25 at 5 08 09 PM" src="https://github.com/user-attachments/assets/74d612f0-5bac-424d-8f5c-b4d6a274bcbd" />

**AD installation in progress...**
<img width="970" height="577" alt="Screenshot 2026-07-25 at 5 09 01 PM" src="https://github.com/user-attachments/assets/25472806-9db7-4376-a094-4df64816167d" />

## Creating the Organizational Units (OUs)

Open `Tools` -> `Active Directory Users and Computers (AD U&C)`

On the **Top-level OUs**, right-click `sga.local` -> `New` -> `Organizational Unit`:
- `SGA-USERS`
- `SGA-COMPUTERS`
- `SGA-GROUPS`

**Top-level OUs:**
<img width="1086" height="635" alt="Screenshot 2026-07-25 at 5 10 00 PM" src="https://github.com/user-attachments/assets/158e4c6e-0a77-464e-a0e9-dbfb341872d6" />

Leave the **"Protect container from accidental deletion"** checkbox ticked, as its good practice, on each OU.

For creating the **Sub-OUs** under `SGA-USERS`, its the same process, right-click `SGA-USERS` -> `New` -> `Organizational Unit`
- `Partners`
- `Associates`
- `Paralegals`
- `Administration`
- `IT`

It's important that these sub-OU names match the `Department` column in the user CSV list, as when it comes time for provisioning, the PowerShell script can place each user into the correct OU automatically. 

**Sub-OUs:**
<img width="1086" height="635" alt="Screenshot 2026-07-25 at 5 10 43 PM" src="https://github.com/user-attachments/assets/e421ca08-8bbb-49c4-99c5-bd68a5adabc9" />

