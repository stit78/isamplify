class Application < ApplicationRecord
  belongs_to :sale_id
  belongs_to :purchase_id
end
