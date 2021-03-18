param ordinal string = '01'
param addressPrefix string = '10.0.0.0/15'
param subnetBt string = '10.0.0.0/24'
param subnetDt string = '10.0.1.0/24'
param owner string = 'rmn'
param costCenter string = 'development'
var vnetName = 'vnet-${ordinal}'

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vnetName
  location: resourceGroup().location
  tags: {
    Owner: owner
    CostCenter: costCenter
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    enableVmProtection: false
    enableDdosProtection: false
    subnets: [
      {
        name: 'subnetBt'
        properties: {
          addressPrefix: subnetBt
        }
      }
      {
        name: 'subnetDt'
        properties: {
          addressPrefix: subnetDt
        }
      }
    ]
  }
}
