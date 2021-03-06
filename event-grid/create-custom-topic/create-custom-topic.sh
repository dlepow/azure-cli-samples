#!/bin/bash

# Give your custom topic a unique name
myTopic=demoContosoTopic

# Create resource group
az group create --name myResourceGroup --location westus2

# Create custom topic
az eventgrid topic create --resource-group myResourceGroup --name $myTopic --location westus2

# Retrieve endpoint and key to use when publishing to the topic
endpoint=$(az eventgrid topic show --name $myTopic -g myResourceGroup --query "endpoint" --output tsv)
key=$(az eventgrid topic key list --name $myTopic -g myResourceGroup --query "key1" --output tsv)

echo $endpoint
echo $key