require 'rails_helper'

RSpec.describe "Bulk Discounts Index page" do
  it 'displays discount info' do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 25 })

    visit merchant_bulk_discounts_path(merch_1.id)

    expect(page).to have_content(discount_a.name)
    expect(page).to have_content(discount_b.name)
    expect(page).to_not have_content(discount_c.name)
    expect(page).to have_content("%20")
    expect(page).to have_content("%30")
    expect(page).to_not have_content("%25")
    expect(page).to have_content(discount_a.threshold)
    expect(page).to have_content(discount_b.threshold)
    expect(page).to_not have_content(discount_c.threshold)
  end

  it "links to discount show page" do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 20 })

    visit merchant_bulk_discounts_path(merch_1.id)

    expect(page).to have_content(discount_a.name)
    click_link "#{discount_a.name}"
    expect(current_path).to eq(merchant_bulk_discount_path(merch_1.id, discount_a.id))
  end

  it 'links to a create form' do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 20 })

    visit merchant_bulk_discounts_path(merch_1.id)

    click_link "New Discount"
    expect(current_path).to eq(new_merchant_bulk_discount_path(merch_1.id))
  end

  it "has a delete discount function" do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_1.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 20 })

    visit merchant_bulk_discounts_path(merch_1.id)

    within("#discounts-#{discount_a.id}") do
      expect(page).to have_link("Delete Discount")
      click_link "Delete Discount"
    end

    within("#discounts-#{discount_b.id}") do
      expect(page).to have_link("Delete Discount")
    end

    within("#discounts-#{discount_c.id}") do
      expect(page).to have_link("Delete Discount")
    end
    expect(page).to_not have_content(discount_a.name)
  end
end
