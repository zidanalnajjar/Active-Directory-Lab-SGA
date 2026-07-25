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
|---------|------------|
| Partners | Saul + 2 senior partners |
| 
