RESOURCEGROUPNAME="training_rg"

LOCATION="eastus"

TOPIC="esales"

EVENTHUB_NAMESPACE="esalesns"

EVENTHUB_NAME="esaleshub"

EVENT_SUBSCRIPTION="esalesevent"

az provider register --namespace Microsoft.EventGrid

az provider show --namespace Microsoft.EventGrid --query "registrationState"

az eventgrid topic create --name $TOPIC -l $LOCATION -g $RESOURCEGROUPNAME


az eventhubs namespace create --name $EVENTHUB_NAMESPACE --resource-group $RESOURCEGROUPNAME

az eventhubs eventhub create --name $EVENTHUB_NAME --namespace-name $EVENTHUB_NAMESPACE --resource-group $RESOURCEGROUPNAME

sh eventhub/eventhub.sh -e $EVENTHUB_NAME -n $EVENTHUB_NAMESPACE -r $RESOURCEGROUPNAME -s $EVENT_SUBSCRIPTION -t $TOPIC