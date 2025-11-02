class Interface < ApplicationRecord
  belongs_to :host
  has_many :ipams, dependent: :destroy
end
