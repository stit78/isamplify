class CoffeeLot < ApplicationRecord
  has_many :potential_clients
  has_many :samples
  has_many :coffee_certifications
  belongs_to :purchase_id

  validates :provenance, presence: true
  validates :tree, presence: true, inclusion: { in: ["Arabica", "Robusta"] }
  validates :iconumber, presence: true
  validates :screen_size, presence: true
  validates :cup_profile, presence: true
  validates :region, presence: true
  validates :quality_description, presence: true
end
