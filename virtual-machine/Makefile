
RG_NAME=MyResourceGroupName
RG_LOCATION=westeurope
ADMIN_USERNAME=theadmin

PROJECT_NAME=MyProjectName
ADMIN_PUB_KEY=`cat ~/.ssh/az_vm_rsa.pub`

VM_IP := $(shell az vm show --resource-group $(RG_NAME) --name "$(PROJECT_NAME)-vm" --show-details --query publicIps --output tsv)

.PHONY: ip
ip:
	echo "VM IP: "$(VM_IP)


# Create private and public keys
# give them a name so that you don't mix them with your other keys. E.g. with a prefix.
# https://docs.microsoft.com/sv-se/azure/virtual-machines/linux/mac-create-ssh-keys
.PHONY: create-key
create-key:
	ssh-keygen -m PEM -t rsa -b 4096

.PHONY: deploy
deploy:
	az group create --name $(RG_NAME) --location $(RG_LOCATION)

	az deployment group create \
	--resource-group $(RG_NAME) \
	--template-file virtual-machine.template.json \
	--parameters projectName=$(PROJECT_NAME) \
	adminUsername=$(ADMIN_USERNAME) \
	adminPublicKey="$(ADMIN_PUB_KEY)"

.PHONY: ssh
ssh:
	ssh $(ADMIN_USERNAME)@$(VM_IP) -i ~/.ssh/az_vm_rsa
