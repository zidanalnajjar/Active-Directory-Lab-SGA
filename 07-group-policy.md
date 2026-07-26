## Group Policy

Group Policy is where the environment gets hardened. Each policy below follows a consistent five-part format — Title, Overview, Path, Justification, Screenshot (Configured Settings)

## How the GPOs were created

In Group Policy Management, right-click `sga.local` -> Create a GPO in this domain, and Link it here, then edit each policy.

## Password Policy

**Overview** — Enforces strong password requirements across the domain.

**Path** - `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`

**Justification** — Everyone at the firm handles confidential client data. Weak or reused passwords are one of the easiest ways into a network, so a strong baseline is non-negotiable when client confidentiality is on the line.

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 55 05 PM" src="https://github.com/user-attachments/assets/f3a81e3f-4db8-423b-94cf-df601cd69cfe" />

---
## Audit Policy

**Overview** — Enables auditing so that access and security-relevant events are logged.

**Path** - `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Audit Policies`

**Justification** - Logging access is a legal requirement for a firm handling confidential client information. Enabling these settings allows for the firm to have a audit trail.

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 57 19 PM" src="https://github.com/user-attachments/assets/a513dbf7-39de-479d-8da2-e7130921e6bf" />

---
## USB Block Policy

**Overview** — Denies access to all removable storage classes.

**Path** - `Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access` 

**Justification** — Blocking USB storage prevents client files from being copied off a machine and walked out the door.

**Screenshot:**
<img width="1121" height="665" alt="Screenshot 2026-07-25 at 7 45 43 PM" src="https://github.com/user-attachments/assets/bdc13225-c7f7-4209-a9a5-5f0b255e17b6" />

---
## Disable Removable Media Policy

**Overview** — Prevents removable devices from being installed at the device level.

**Path** - `Computer Configuration -> Policies -> Administrative Templates -> System -> Device Installation -> Device Installation Restrictions`

**Justification** — Device-level enforcement backs up the USB block above — even if a policy is bypassed at one layer, the device simply won't install.

**Screenshot:**
<img width="998" height="601" alt="Screenshot 2026-07-25 at 7 54 52 PM" src="https://github.com/user-attachments/assets/b845717c-ce34-410e-bf9c-86ab8ce57fc5" />

---
## Restrict Control Panel Policy

**Overview** — Blocks non-IT users from opening Control Panel and PC settings.

**Path** - `User Configuration -> Policies -> Administrative Templates -> Control Panel` 

**Justification** — Regular staff shouldn't be changing system settings; keeping Control Panel out of their hands prevents accidental (or deliberate) misconfiguration.

**Screenshot:**
<img width="1247" height="711" alt="Screenshot 2026-07-25 at 7 55 26 PM" src="https://github.com/user-attachments/assets/2728ebb7-3e79-4f21-82af-cf29b6e95dc0" />

---
## Screen Lock Policy

**Overview** - Automatically locks an unattended machine after a specified period of inactivity.

**Path** - `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options`

**Justification** - Confidential information shouldn't be left exposed on an unattended screen in an office where clients and visitors are present.

**Screenshot:**
<img width="1001" height="602" alt="Screenshot 2026-07-25 at 5 55 59 PM" src="https://github.com/user-attachments/assets/b37ad6e7-8ded-4c53-ade6-0c56c8106bfb" />

