require "rails_helper"

RSpec.describe "Bulk Discount edit page" do
  it "has an edit form" do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 25 })

    visit edit_merchant_bulk_discount_path(merch_1.id, discount_a.id)

    fill_in(:name, with: "New Deal")
    fill_in(:percentage, with: 15)
    fill_in(:threshold, with: 5)
    click_button "Update Discount"

    expect(current_path).to eq( "/merchants/#{merch_1.id}/bulk_discounts/#{discount_a.id}")
    expect(page).to have_content("New Deal: 15% off 5 items or more!")
    expect(page).to have_content("Discount has been updated")
  end

  xit "returns an error message if form is incorrect" do
    merch_1 = Merchant.create!(name: "Shop Here")
    merch_2 = Merchant.create!(name: "Buy Here")

    discount_a = merch_1.bulk_discounts.create({name:"Discount A", percentage: 20, threshold: 10 })
    discount_b = merch_1.bulk_discounts.create({name:"Discount B", percentage: 30, threshold: 15 })
    discount_c = merch_2.bulk_discounts.create({name:"Discount C", percentage: 25, threshold: 25 })

    visit edit_merchant_bulk_discount_path(merch_1.id, discount_a.id)

    fill_in(:name, with: nil)
    fill_in(:percentage, with: 15)
    fill_in(:threshold, with: 5)
    click_button "Update Discount"

    expect(current_path).to eq( "/merchants/#{merch_1.id}/bulk_discounts/#{discount_a.id}")
    expect(page).to_not have_content("New Deal: 15% off 5 items or more!")
    expect(page).to have_content("Error: Discount not updated")
  end
end
