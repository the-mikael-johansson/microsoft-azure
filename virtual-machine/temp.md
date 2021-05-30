# SonarQube running in a Virtual Machine

## Getting started

```
make create-key
make deploy
```

Install SonarQube:

Login through SSH: ```make ssh```
From the SSH type:
```
curl -L0 https://themikael.... | sh

```

Configure SonarQube:



# ARM

Virtual machine extensions and features for Linux

https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/features-linux


Use the Azure Custom Script Extension Version 2 with Linux virtual machines

https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux

Tutorial: Deploy virtual machine extensions with ARM templates

https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-deploy-vm-extensions

Configure and customize SQL Server Docker containers
https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure?view=sql-server-ver15&pivots=cs1-bash#persist
```
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=xxx' -p 1433:1433 -v sqlvolume:/var/opt/mssql -d mcr.microsoft.com/mssql/server:2019-latest
```


Create SSH key files:
```
make create-key
```

Create resource groupe, virtual machine and all services:
```
make deploy
```

Login in to it using SSH:
```
make ssh
```


```

sudo useradd sonar
sudo chown -R sonar:sonar /opt/sonarqube

```

Install SonarQube using https://docs.microsoft.com/sv-se/azure/virtual-machines/extensions/custom-script-linux


sonar.jdbc.url=jdbc:sqlserver://localhost;databaseName=sonar
sonar.jdbc.username=sonarqube
sonar.jdbc.password=mypassword


# Från makefile
# docker-sql:
# 		docker run --name sqlexpress \
# 		-e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=xxx' \
# 		-e 'MSSQL_PID=Express' -p 1433:1433 \
# 		-d mcr.microsoft.com/mssql/server:2019-latest