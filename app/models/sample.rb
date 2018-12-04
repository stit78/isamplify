class Sample < ApplicationRecord
  belongs_to :coffeelot_id
  belongs_to :exporter, className: 'User'
  belongs_to :trader, className: 'User'
end
