## Planning and Design

Before deploying any resource, the design of the AD environment was planned out. The goal of this lab was to let a real law firm's requirements drive the technical structure. Essentially, every group, policy, or OU exists for a reason.

## Organizational Unit design 
| OU                 | Purpose                                | 
|--------------------|----------------------------------------|
| Domain Controllers | Holds `DC-01`                          |
| Computers          | All workstations and servers           | 
| Users              | Broken into sub-OUs (delineated below) |

## Sub-OUs under Users

| Sub-OUs | Whos in it |
|---------|----------------------------|
| Partners | Saul + 2 senior partners  |
| Associates | 4 junior attorneys      |
| Paralegals | 4 case-support staff    |
| Admin      | 3 reception + 2 billing |
| IT         | 2 system administrators | 

## Security groups
Security groups are what actually determine access. Instead of adding individuals to resources (folders) one by one, users go into the correct security group. The group gets the permission for access. Should a user need to be decomissioned, rather than remove them from multiple resources one by one, you merely remove them from the security group.

| Group           | Access                                       | 
|-----------------|----------------------------------------------|
| `SG-PARTNERS`   | Full file share, all case files, billing     | 
| `SG-ASSOCIATES` | Case files they are particularly assigned to | 
| `SG-PARALEGALS` | Read-only access on case-files               |
| `SG-ADMIN`      | Shared drive, scheduling, billing            |
| `SG-IT`         | Full admin rights everywhere                 |  

## Distrbution groups
Distribution groups are merely for communication.
| Group          | Whos in it | 
|----------------|------------------------|
| `DL-ALLSTAFF`  | Everyone               | 
| `DL-ATTORNEYS` | Partners + Associates  |
| `DL-PARTNERS`  | Partners only          |
| `DL-SUPPORT`   | Paralegals             |

## Group Policy plan
Each policy was planned with an explicit link target and a justification.
| GPO                     | Links to                          | Justification                                                                |
|-------------------------|-----------------------------------|------------------------------------------------------------------------------|
| Password policy         | Domain root                       | Common sense - everyone needs strong passwords as client data is on the line |
| Screen lock             | Domain root                       | Confidental files cannot be left exposed (5 min screen lock)                 |
| Audit policy            | Domain root                       | Log all access - legal compliance requirement                                | 
| Event log retention     | Domain root                       | Logs can't be overwritten - event preservation                               | 
| Disable removable media | Computer OUs (except IT machines) | Device-level enforcement                                                     |
| Restrict Control Panel  | Users OU (except IT)              | Non-IT can't change system settings                                          |
| Software restriction    | Users OU (except IT)              | No unauthorized software installs                                            |

## Network design & the flat-network problem
The planned network design for this small lab is a **flat network**. A flat network is a single segment with no subnets.

This by far is the biggest weakness of this design. A flat network is at risk of a compromised machine being able to easily move laterally across a network to infect other hosts, which is a massive risk in an enviroment holding priviledged, confidental client data. Subnet segmentation with firewall/NSG rules is a necessary improvement to make in the future for this lab.
