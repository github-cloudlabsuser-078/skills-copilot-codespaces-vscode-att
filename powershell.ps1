# Define parameters
$resourceGroupName = "<resource-group-name>"
$location = "<location>"
$storageAccountName = "<storage-account-name>"

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName Standard_LRS `
    -Kind StorageV2 `
    -EnableHttpsTrafficOnly $true

# Set the storage account tags
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccount.Tags.Add("environment", "staging")
Set-AzResource -ResourceId $storageAccount.Id -Tag $storageAccount.Tags -Force