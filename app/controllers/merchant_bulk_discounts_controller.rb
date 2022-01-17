class MerchantBulkDiscountsController < ApplicationController
  before_action :merchant
  def index

  end

  def show
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def new
  end

  def create
    discount = merchant.bulk_discounts.create!(bulk_discount_params)

    redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
  end

  def edit
    @bulk_discounts = BulkDiscount.find(params[:id])
  end

  def update
    @bulk_discount = BulkDiscount.find(params[:id])

    if @bulk_discount.update(bulk_discount_params)
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts/#{@bulk_discount.id}"
      flash[:alert] = "Discount has been updated"
    else
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts/edit"
      flash[:error] = "Error: Discount not updated"
    end
  end

  def destroy
    bulk_discount = BulkDiscount.find(params[:id])
    merchant.bulk_discounts.delete(bulk_discount)
    redirect_to "/merchants/#{@merchant.id}/bulk_discounts"    
  end

  def merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  private

  def bulk_discount_params
    params.permit(:name, :percentage, :threshold)
  end
end
