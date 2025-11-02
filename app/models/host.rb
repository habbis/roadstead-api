class Host < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :interfaces, dependent: :destroy
  has_many :host_vars, dependent: :destroy
  # has_many :host2hostgroups, dependent: :destroy
end
