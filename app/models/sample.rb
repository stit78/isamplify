class Sample < ApplicationRecord
  belongs_to :coffee_lot
  belongs_to :exporter, class_name: 'User'
  belongs_to :trader, class_name: 'User'

  STATUSES = ["pending", "received", "tested", "labelled", "sent", "approved", "archived", "history"]

  validates :stage, presence: true, inclusion: { in: ["Offer Sample", "Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Sale Sample"] }
  validates :sweetness, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :acidity, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :clean, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :status, presence: true, inclusion: STATUSES
  enum status: STATUSES

  scope :count_with_status, ->(status) { where(status: status).count }

  include PgSearch
  pg_search_scope :search_sample,
    against: [:stage, :status, :id],
    associated_against: {
      exporter: [:first_name, :last_name, :role, :company_name],
      trader: [:role],
      coffee_lot: [:iconumber, :provenance, :id]
    },
    using: {
      tsearch: { prefix: true }
    }

  def safe_sweetness
    sweetness || 0
  end

  def safe_acidity
    acidity || 0
  end

  def safe_clean
    clean || 0
  end

  private

  def send_reception_confirmation
    ExporterMailer.reception_confirmation(self).deliver_now
  end
end
