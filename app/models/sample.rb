class Sample < ApplicationRecord
  belongs_to :coffee_lot
  belongs_to :exporter, class_name: 'User'
  belongs_to :trader, class_name: 'User'

  validates :stage, presence: true, inclusion: { in: ["Offer Sample", "Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Sale Sample"] }
  validates :sweetness, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :acidity, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :clean, inclusion: { in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }, allow_blank: true
  validates :status, presence: true, inclusion: { in: ["pending", "received", "tested", "labelled", "sent"] }
  enum status: ["pending", "received", "tested", "labelled", "sent"]

  scope :count_with_status, ->(status) { where(status: status).count }

  include PgSearch
  pg_search_scope :search_sample,
    against: [:coffee_lot, :exporter, :trader, :stage, :status],
    using: {
      tsearch: { prefix: true }
    }

  private

  def send_reception_confirmation
    ExporterMailer.reception_confirmation(self).deliver_now
  end
end
