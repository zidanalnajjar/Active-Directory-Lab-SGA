## Active Directory Lab - SG & Associates (sga.local)

This is a hands-on Active Directory lab built for a fictional law firm, hosted on Microsoft Azure. This lab covers the full lifecycle of a small Windows domain: designing the directory on paper, standing up a domain controller and file server, provisioning users and groups, locking down file-share permissions and hardening the environment with Group Policy.

Because of the scenario, that is, being a law firm, design choices were driven by constraints such as client confidentality, billing seperation, and legal compliance/auditing requirements.

## Why a law firm?

Framing the lab around a real world-organization forced every technical decision to have a reason behind it rather than being configured for its own sake. Partners can see all case files; associates can only see case files they're assigned; paralegals get read-only; billing is walled off; and IT is exempted from these constraints so that they can actually adminsister the machines. These business constraints map directly onto the OUs, security groups, NTFS permissions, and GPOs.

## What was built

- **Domain controller:** Windows Server VM, AD DS role installed and promoted to a new forest, `sga.local`.
- **Organizational units:** `SGA-USERS` (with per-department sub-OUs), `SGA-COMPUTERS`, and `SGA-GROUPS`.
- **Provisioned users with PowerShell:** From a CSV file, each individual was dropped into the correct department automatically.
- **Groups:** Security groups (Global scope) for access control and distribution lists for mail/comms, with users assigned to each.
- **File server:** A second, domain-joined Windows Server that hosts four shared folders (`Case Files`, `Billing`, `Shared Drive`, and `IT`) with permissions driven entirely by security-group membership, 
- **Group policy hardening:** Password policy, screen lock, audit logging, USB/removable-meda blocking, Control Panel restrictions, and software restrictions

## Skills demonstrated 
- Windows Server administration and AD DS deployment (forest/DC promotion, DNS)
- Active Directory object design - OUs, security and distribution groups, group scope decisions
- PowerShell automation for bulk provisioning
- NTFS / share permission design for using group-based access control (RBAC)
- Group Policy authoring and targeting, including security filtering to exempt IT
- Azure IaaS: VMs, resource groups, virtual networks


## Environment details
- **Domain/forest:** `sga.local` (new forest)
- **Domain controller:** `DC-01` (also DNS)
- **File server:** `FILE-SERV01`(domain joined)

## Resources 
- [Best practices for securing Active Directory](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/best-practices-for-securing-active-directory)
- [Group Policy overview for Active Directory](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview)
- [Best Practices for Security and Protection of Active Directory](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/best-practices-for-securing-active-directory) 
