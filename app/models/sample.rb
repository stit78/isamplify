class Sample < ApplicationRecord
  belongs_to :coffee_lot
  belongs_to :exporter, class_name: 'User'
  belongs_to :trader, class_name: 'User'

  validates :stage, presence: true, inclusion: { in: ["Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Offer Sample", "Sale Sample"]  }
  validates :sweetness, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :acidity, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :clean, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :status, presence: true, inclusion: { in: ["Pending", "Received", "Tested", "Label printed", "Sent"] }
end
