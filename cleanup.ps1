
$rg="polaris-test"

# list all resources
az resource list -g $rg  
# List containers
az resource list -g $rg  --resource-type  "Microsoft.App/containerApps"

#list by name
az resource list --name 'polaris-testenv' -g $rg


#cleanup

# 1. cleanup containers
az resource delete -n store -g $rg --resource-type  "Microsoft.App/containerApps"
az resource delete -n products -g $rg --resource-type  "Microsoft.App/containerApps"
az resource delete -n inventory -g $rg --resource-type  "Microsoft.App/containerApps"


# 2. cleanup Container Environment
# "Microsoft.App/managedEnvironments"
az resource delete -n 'polaris-testenv' -g $rg --resource-type  "Microsoft.App/managedEnvironments"

# 3. cleanup Application Insights
az resource delete -n 'polaris-testai' -g $rg --resource-type  "Microsoft.Insights/components"

# 4. cleanup Log Analytics workspace
az resource delete -n 'polaris-testlogs' -g $rg --resource-type  "Microsoft.OperationalInsights/workspaces"


# 5. cleanup ACR
#"Microsoft.ContainerRegistry/registries"
az resource delete -n 'polaristestacr' -g $rg --resource-type  "Microsoft.ContainerRegistry/registries"

