class Host < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :interface, dependent: :destroy
  has_many :host_var, dependent: :destroy
end
