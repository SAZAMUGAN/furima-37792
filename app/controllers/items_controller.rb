class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Prototype.new(item_params)
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
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id, :ken_name_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end
