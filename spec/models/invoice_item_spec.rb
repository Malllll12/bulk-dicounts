require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end

  describe 'full revenue' do
    it 'returns revenue without discount' do
      merchant = Merchant.create!(name: 'Shop Here')
      not_included_merchant = Merchant.create!(name: 'Dont Shop Here')
      customer = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
      item_1 = Item.create!(merchant_id: merchant.id, name: 'widget-1', description: 'widget description',
                            unit_price: 100)
      item_2 = Item.create!(merchant_id: merchant.id, name: 'widget-2', description: 'widget description',
                            unit_price: 200)
      invoice = Invoice.create!(customer_id: customer.id, status: 'completed')
      invoice_item_1 = InvoiceItem.create!(invoice_id: invoice.id, item_id: item_1.id, quantity: 3,
                                           unit_price: 100)
      invoice_item_2 = InvoiceItem.create!(invoice_id: invoice.id, item_id: item_2.id, quantity: 3,
                                           unit_price: 200)
      discount_a = merchant.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
      discount_b = merchant.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })

      expect(invoice_item_1.full_revenue).to eq(300)
      expect(invoice_item_2.full_revenue).to eq(600)
    end
  end
end
