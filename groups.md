## Security and Distribution Groups
Security groups drive access to resources, and distribution groups are essential for communication.

## Creating the security groups
In **AD Users and Computers**, right-click the `SGA-Groups` OU -> **New Group**, and then create each security group.

For the **Group Scope**, **Global** was chosen. By making it Global, it simply means that these groups can access resources anywhere across the domain. For the context of this lab, all resources will be stored on another server, the file server. Additionally, a global scope makes the design **scalable**.
