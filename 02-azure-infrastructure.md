## Azure Infrastructure 

The entire enviroment runs on Azure IaaS. This section covers creating the resource group, the first virtual machine (the domain controller), and connecting to it remotely.

## Resource group
A resource group was created to hold all the lab resources together:
1. In the Azure portal, go to `Resource Groups` -> `Create`
2. Fill in the resource group details (name, region, subscription)

## Domain controller VM 
The first VM becomes `DC-01`
1. Search for `Virtual Machines`, then `Create` -> `Azure virtual machine`
2. Configure the VM under **Basics** tab (image = Windows Server, size, admin credentials, etc)
3. **Port 3389 (RDP)** was left open so that the VM could be reached over Remote Desktop.
4. Review and Create.

## Connecting over RDP
Once the VM was deployed
1. Installed the **Windows App** (Microsoft Remote Desktop) to RDP into the VM (keep port 3389 open)
2. Grabbed the VM's public IP address from the Azure portal
3. Connected through Microsoft Remote Desktop using the IP from step 2
