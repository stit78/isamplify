class Sale < ApplicationRecord
  has_many :coffee_lots
  has_many :applications
  belongs_to :trader, className: 'User'
  belongs_to :client, className: 'User'
end
