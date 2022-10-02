STORAGEACCOUNTNAME="traininglakehouse"

RESOURCEGROUPNAME="training_rg"

LOCATION="eastus"

az storage account create --name $STORAGEACCOUNTNAME --resource-group $RESOURCEGROUPNAME --kind StorageV2 --location $LOCATION  --hns true --sku Standard_LRS --tags owner=data engineering project=lakehouse environment=development



NAMESPACE="bronze"

az storage fs create -n $NAMESPACE --account-name $STORAGEACCOUNTNAME --metadata project=lakehouse environment=development layer=bronze --only-show-errors