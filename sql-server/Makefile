
RG_NAME=MjTestGroup3
RG_LOCATION=westeurope

PROJECT_NAME=SonarQubeDb

.PHONY: deploy
deploy:
	az group create --name $(RG_NAME) --location $(RG_LOCATION)

	az deployment group create \
	--resource-group $(RG_NAME) \
	--template-file sql-server.template.json \
	--parameters sql-server.parameters.json
