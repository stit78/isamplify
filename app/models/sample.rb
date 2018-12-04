class Sample < ApplicationRecord
  belongs_to :coffeelot_id
  belongs_to :exporter, className: 'User'
  belongs_to :trader, className: 'User'

  validates :stage, presence: true, inclusion: { in: ["Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Offer Sample", "Sale Sample"] }
  validates :sweetness, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  validates :acidity, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  validates :clean, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  validates :status, presence: true, inclusion: { in: ["Pending", "Received", "Tested", "Label printed", "Sent"] }
end
