# How to Create an Azure VM

### From the Azure Portal

> These are the steps I took creating my first Virtual Machine in Azure. Inputs like Subscription might change depending on your account and settings.

> NOTE: make sure you are not connected to a VPN when creating a VM. It selects the wrong region and limits size options.

1. Go to the [Azure portal](https://portal.azure.com/#home)
2. Under Azure services, click **Virtual machines**.
3. Click the **Create** button and select **Azure virtual machine**.
4. In the **Basics** tab, fill in the following fields:
   1. **Subsctiption:** leave default
   2. **Resource group:** type a new one or select an existing one
      1. Resource group is a collection of resources that share the same lifecycle, permissions, and policies.
   3. **Virtual machine name:** enter a name for your VM (e.g. "MyVM")
   4. **Region:** "(US) East US" or "(US) East US 2"
   5. Skip down to **Image:** "Ubuntu Server <latest-version> LTS"
   6. Skip down to **Size:** select a standard size
   7. **Availability options:** leave default
   8. **Availability zone:** choose a zone that is compatible with the size you chose. See message under Size field
      1. Availability zones create redundancy across multiple regions. Azure handles failover of data in a single zone. You are responsible for failover between multiple zones.
   9. **VM architecture:** leave default, "x64"
   10. Under Administrator account, **Authentication type:** "SSH public key".
   11. **Username:** type username for the VM administrator
   12. **SSH public key source:** leave default
   13. **Key pair name:** "\<vm-name\>_key".
   14. **Public inbound ports:** "Allow selected ports"
   15. **Select inbound ports:** "HTTP (80)", "HTTPS (443)", and "SSH (22)"
5. If you need to setup a Virtual network, click the **Networking** tab in the menu at the top.
6. Click **Next** until you reach the Networking tab.
   1. **Virtual network:** create a new VNet with the default Address range and Subnet name
   2. Leave all other fields as their defaults
7. All other tabs can leave their fields as their default. In the tabs menu, click **Review + create**.
   1. Wait for validation process to complete with green message at the top, "Validation passed".
   2. **Preferred phone number:** enter if you want to
   3. Click **Create** button
8. Final steps
   1. If you generated a new key pair, in the pop-up "Generate new key pair", select **Download private key and create resource**
   2. Save this key file to your personal OneDrive at Projects/Web/Azure/
   3. Copy the key file to an easy to access local destination on the computer you will be SSHing from (e.g. /mnt/c/Users/jwhitney/keys/
   5. When deployment is finished, click **Go to resource**
   6. Copy the **Public IP address** for connection purposes

### Connect to VM with Public Key

> If you need the credentials for connecting, when viewing the virtual machine in the Azure portal, click **Connect** the left-hand menu.

1. Open PowerShell or Ubuntu WSL on your Windows machine
2. If not already in the mnt/c/Users/jwhitney directory, cd there
3. Change permissions for the key file you will use to SSH, ``chmod 0600 <key>.pem``
4. At the command prompt, ``ssh -i keys/<key>.pem <admin-username>@<vm-public-ip>``

### Connect to VM with password

1. In the Azure Portal, when viewing the Virtual Machine, scroll down to *Help* in the left-hand menu and click **Reset password**.
2. Fill out the following to set password authentication for the VM
   1. **Mode:** Reset password
   2. **Username:** <admin-user>
   3. **Password:** <new-password>
   4. **Confirm password:** <new-password>
   5. Now you can SSH with a password instead of public key, ``ssh <admin-user>@<vm-ip-address>``

### Resources

1. [Quickstart Create a Linux VM in Azure Portal](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal?tabs=ubuntu)
2. [What are availability Zones?](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview?toc=%2Fazure%2Fvirtual-machines%2Ftoc.json&tabs=azure-cli)