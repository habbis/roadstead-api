class Hostgroup < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  # belongs_to :host
  has_many :group_vars, dependent: :destroy
  # has_many :host2hostgroups, dependent: :destroy
end
