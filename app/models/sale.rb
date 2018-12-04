class Sale < ApplicationRecord
  has_many :coffee_lots
  has_many :applications
  belongs_to :trader, class_name: 'User'
  belongs_to :client, class_name: 'User'
end
