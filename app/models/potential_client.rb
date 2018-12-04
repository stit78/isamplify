class PotentialClient < ApplicationRecord
  belongs_to :coffeelot_id
  belongs_to :client, className: 'User'
end
