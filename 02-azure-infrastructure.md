## Azure Infrastructure 

The entire enviroment runs on Azure IaaS. This section covers creating the resource group, the first virtual machine (the domain controller), and connecting to it remotely.

## Resource group
A resource group was created to hold all the lab resources together:
1. In the Azure portal, go to `Resource Groups` -> `Create`
2. Fill in the resource group details (name, region, subscription)

**Creating a resource group:**
<img width="900" height="457" alt="Screenshot 2026-07-25 at 4 52 59 PM" src="https://github.com/user-attachments/assets/59dfbb80-c0b3-4513-86dd-d424aca51c9d" />

## Domain controller VM 
The first VM becomes `DC-01`
1. Search for `Virtual Machines`, then `Create` -> `Azure virtual machine`
2. Configure the VM under **Basics** tab (image = Windows Server, size, admin credentials, etc)
3. **Port 3389 (RDP)** was left open so that the VM could be reached over Remote Desktop.
4. Review and Create.

**Creating a Windows Server VM:**
<img width="900" height="446" alt="Screenshot 2026-07-25 at 4 56 11 PM" src="https://github.com/user-attachments/assets/7eae2698-cb85-422a-a36f-ed4ffdb67242" />

(The VM was subsequently renamed DC-01...)

## Connecting over RDP
Once the VM was deployed
1. Installed the **Windows App** (Microsoft Remote Desktop) to RDP into the VM (keep port 3389 open)
2. Grabbed the VM's public IP address from the Azure portal
3. Connected through Microsoft Remote Desktop using the IP from step 2

**Grabbing the VM IP:**
<img width="2691" height="1283" alt="Screenshot 2026-07-25 at 16-59-59" src="https://github.com/user-attachments/assets/bcc75244-adc5-466c-ba7e-355dc9f63c6f" />

**Connecting through RDP with the IP:**
<img width="1861" height="1108" alt="Screenshot 2026-07-25 at 17-03-37" src="https://github.com/user-attachments/assets/9d30b69d-e9b6-4233-8326-8084d22ca6fa" />




