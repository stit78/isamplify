class Purchase < ApplicationRecord
  has_many :coffee_lots
  has_many :applications
  belongs_to :trader, className: 'User'
  belongs_to :exporter, className: 'User'
  belongs_to :owner, className: 'User'

end
