# Vlan

# Vlan.create(name: 'int_5_test_dc1', vlan_id: 5, prefix: '10.60.5.0/24')
# Vlan.create(name: 'ext_6_web_dc1', vlan_id: 6, prefix: '10.60.6.0/28')

Vlan.find_or_create_by(name: 'int_5_test_dc1') do |vlan|
  vlan.vlanid = '5'
  vlan.prefix = '10.60.5.0/24'
  vlan.cluster = 'dc10-prod-mgmt'
end

Vlan.find_or_create_by(name: 'ext_6_web_dc1') do |vlan|
  vlan.vlanid = '6'
  vlan.prefix = '10.60.6.0/28'
  vlan.cluster = 'dc10-test-mgmt'
end

#Hosts.find_or_create_by(FQDN: 'hf-test1.dc1.ncop.no') do |vlan|
#  vlan.prefix = '10.60.6.0/28'
#  vlan.cluster = 'dc10-test-mgmt'
#end
