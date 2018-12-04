class Purchase < ApplicationRecord
  has_many :coffee_lots
  has_many :applications
  belongs_to :trader, class_name: 'User'
  belongs_to :exporter, class_name: 'User'
  belongs_to :owner, class_name: 'User'

end
