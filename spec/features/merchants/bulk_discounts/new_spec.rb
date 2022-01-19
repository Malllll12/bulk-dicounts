require 'rails_helper'

RSpec.describe "New Bulk Discount page" do
  it "has a form to create a new discount and redirects back to index page" do
    merch_1 = Merchant.create!(name: 'merchant1')

    visit new_merchant_bulk_discount_path(merch_1.id)

    fill_in :name, with: 'Buy Bulk!'
    fill_in :percentage, with: 20
    fill_in :threshold, with: 10

    click_button "Submit"
    expect(current_path).to eq(merchant_bulk_discounts_path(merch_1.id))
    expect(page).to have_link('Buy Bulk!')
    expect(page).to have_content('%20')
    expect(page).to have_content(10)
  end

  it "if form is incorrect they are redirected to try again" do
    merch_1 = Merchant.create!(name: 'merchant1')

    visit new_merchant_bulk_discount_path(merch_1.id)

    fill_in :name, with: nil
    fill_in :percentage, with: 20
    fill_in :threshold, with: 10
    click_button "Submit"

    expect(current_path).to eq(new_merchant_bulk_discount_path(merch_1.id))
    expect(page).to_not have_link('Buy Bulk!')
    expect(page).to_not have_content('%20')
    expect(page).to_not have_content(10)
    expect(page).to have_content("Incorrect Input. Go again.")
  end
end
