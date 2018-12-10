class CoffeeLot < ApplicationRecord
  has_many :potential_clients
  has_many :samples
  has_many :coffee_certifications
  belongs_to :purchase, optional: true

  validates :provenance, presence: true
  validates :tree, presence: true, inclusion: { in: ["Arabica", "Robusta"] }
  validates :iconumber, presence: true, uniqueness: true
  validates :screen_size, presence: true, inclusion: { in: [8, 10, 12, 14, 16, 18, 20] }
  validates :cup_profile, presence: true
  validates :region, presence: true
  validates :quality_description, presence: true
end
