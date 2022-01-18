class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  has_one :merchant, through: :item
  has_many :bulk_discounts, through: :merchant

  enum status: ["pending", "packaged", "shipped"]

  def full_revenue
    (unit_price * quantity)
  end
end
