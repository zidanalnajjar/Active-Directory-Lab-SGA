## Security and Distribution Groups

Security groups control **access**; distribution groups are used for **communication**.

## Creating the security groups

In **AD Users and Computers**, right-click the `SGA-Groups` OU -> **New Group**, and then create each security group.

For the **Group Scope**, **Global** was chosen. By making it Global, it simply means that these groups can access resources anywhere across the domain. For the context of this lab, all resources will be stored on another server, the file server. Additionally, a global scope makes the design **scalable**: as the firm grows, you may continue to simply add users into the correct group. If you wish to make the design more granular, you can, through nesting. Nesting would be especially helpful should the firm choose to create a second domain. 

Security groups created:
- `SG-PARTNERS`
- `SG-ASSOCIATES`
- `SG-PARALEGALS`
- `SG-ADMIN`
- `SG-IT`

## Adding users to security groups 

After creating the security groups, users were added **manually** according to the access design performed in a previous step ____________________. When determining who recieves access to files, group membership plays the primary role in deciding that.

## Distribution groups

Distribution lists are created in the same way as security groups, these too exist in `SGA-GROUPS` OU.

| Group          | Members               |
|----------------|-----------------------|
| `DL-ALLSTAFF`  |  Members              |
| `DL-ATTORNEYS` | Partners + Associates | 
| `DL-PARTNERS`  | Partners only         |
| `DL-SUPPORT`   | Paralegals            |


**Security and Distribution Groups created:**
<img width="1053" height="602" alt="Screenshot 2026-07-25 at 5 12 41 PM" src="https://github.com/user-attachments/assets/f82d7060-7b20-4cae-949b-7617777fc5e7" />

**Users manually added to security/distribution groups:**
<img width="1053" height="602" alt="Screenshot 2026-07-25 at 5 13 52 PM" src="https://github.com/user-attachments/assets/3d58eda0-cf1f-40dd-8d89-bdb6dd55d5e1" />
