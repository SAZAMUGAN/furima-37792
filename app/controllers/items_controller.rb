class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id,
                                 :ken_name_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
