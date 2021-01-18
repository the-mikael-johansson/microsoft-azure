# Deploy a Virtual Machine to Azure

This example deploys a virtual machine to Azure using ARM templates using three commands. Run it from your local development machine or trigger from Microsoft DevOps Release Pipelines.

## Requirements

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### Windows

- [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
- [Git Bash](https://gitforwindows.org)

### Linux/macOS

No extra steps.

## Getting started

```
make create-key
make deploy
```

Create resource groupe, virtual machine and all services:
```
make deploy
```

Login in to the machine using SSH:
```
make ssh
```

## More about Virtual Machines in Azure

Virtual machine extensions and features for Linux

https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/features-linux

Use the Azure Custom Script Extension Version 2 with Linux virtual machines

https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux

Tutorial: Deploy virtual machine extensions with ARM templates

https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-deploy-vm-extensions


---
By [Mikael Johansson](https://www.linkedin.com/in/the-mikael-johansson/)