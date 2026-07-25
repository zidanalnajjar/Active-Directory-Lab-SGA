## Group Policy

Group Policy is where the environment gets hardened. Each policy below follows a consistent four-part format — Title, Overview, Settings, Justification.

## How the GPOs were created

In Group Policy Management, right-click `sga.local` -> Create a GPO in this domain, and Link it here, then edit each policy.

## Password Policy

**Overview** — Enforces strong password requirements across the domain.

**Settings** - 

**Justification** — Everyone at the firm handles confidential client data. Weak or reused passwords are one of the easiest ways into a network, so a strong baseline is non-negotiable when client confidentiality is on the line.

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 55 05 PM" src="https://github.com/user-attachments/assets/f3a81e3f-4db8-423b-94cf-df601cd69cfe" />

## Audit Policy

**Overview** — Enables auditing so that access and security-relevant events are logged.

**Settings** - 

**Justification** — Logging all access is a legal compliance requirement for a firm handling privileged client information. If something is ever questioned, there needs to be an audit trail.

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 57 19 PM" src="https://github.com/user-attachments/assets/a513dbf7-39de-479d-8da2-e7130921e6bf" />


## USB Block Policy

**Overview** — Denies access to all removable storage classes.

**Settings** - 

**Justification** — Blocking USB storage prevents client files from being copied off a machine and walked out the door.

## Disable Removable Media Policy

**Overview** — Prevents removable devices from being installed at the device level.

**Settings** - 

**Justification** — Device-level enforcement backs up the USB block above — even if a policy is bypassed at one layer, the device simply won't install.

## Restrict Control Panel Policy

**Overview** — Blocks non-IT users from opening Control Panel and PC settings.

**Settings** - 

**Justification** — Regular staff shouldn't be changing system settings; keeping Control Panel out of their hands prevents accidental (or deliberate) misconfiguration.

## Software Restriction Policy

**Overview** — Prevents users from installing/running unauthorized software.

**Settings** -

**Justification** — Unauthorized software is a common malware vector and a compliance risk. Restricting installs keeps the firm's endpoints to a known, approved software set.

## Screen Lock Policy

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 55 59 PM" src="https://github.com/user-attachments/assets/b37ad6e7-8ded-4c53-ade6-0c56c8106bfb" />

