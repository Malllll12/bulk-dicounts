class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  has_one :merchant, through: :item
  has_many :bulk_discounts, through: :merchant

  enum status: ["pending", "packaged", "shipped"]

  def full_revenue
    (unit_price * quantity)
  end

  def ii_discount
    item.merchant.bulk_discounts.where('bulk_discounts.threshold <= ?', quantity)
                                .order(percentage: :desc)
                                .first
  end

  def discounted_revenue
    if ii_discount.nil?
      full_revenue
    else
      (full_revenue * (1 - (ii_discount.percentage/ 100.00)))
    end
  end
end
