## Group Policy

Group Policy is where the environment gets hardened. Each policy below follows a consistent four-part format — Title, Overview, Settings, Justification.

## How the GPOs were created

In Group Policy Management, right-click `sga.local` -> Create a GPO in this domain, and Link it here, then edit each policy.

## Password Policy

**Overview** — Enforces strong password requirements across the domain.

**Settings** - 

**Justification** — Everyone at the firm handles confidential client data. Weak or reused passwords are one of the easiest ways into a network, so a strong baseline is non-negotiable when client confidentiality is on the line.

## Audit Policy

**Overview** — Enables auditing so that access and security-relevant events are logged.

**Justification** — Logging all access is a legal compliance requirement for a firm handling privileged client information. If something is ever questioned, there needs to be an audit trail.
