# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Vlan.create(name: 'int_5_test_dc1', vlan_id: 5, prefix: '10.60.5.0/24')
# Vlan.create(name: 'ext_6_web_dc1', vlan_id: 6, prefix: '10.60.6.0/28')

puts Rails.env.downcase

# load the correct seeds file for our Rails environment
load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))

