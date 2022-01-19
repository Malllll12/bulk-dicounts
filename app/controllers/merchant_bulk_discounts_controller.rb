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
    redirect_to merchant_bulk_discounts_path(@merchant.id)
  end

  def edit
    @bulk_discounts = BulkDiscount.find(params[:id])
  end

  def update
    bulk_discount = BulkDiscount.find(params[:id])
    if bulk_discount.update(bulk_discount_params)
      redirect_to  merchant_bulk_discount_path(@merchant, bulk_discount)
      flash[:alert] = "Discount Updated Successfully"
    else
      redirect_to  edit_merchant_bulk_discount_path(@merchant, bulk_discount)
      flash[:error] = "Incorrect Input: Do it again."
    end
  end

  def destroy
    bulk_discount = BulkDiscount.find(params[:id])
    merchant.bulk_discounts.delete(bulk_discount)
    redirect_to merchant_bulk_discounts_path(@merchant.id)
  end

  def merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  private

  def bulk_discount_params
    params.permit(:name, :percentage, :threshold)
  end
end
