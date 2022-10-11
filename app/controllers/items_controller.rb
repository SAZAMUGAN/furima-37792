class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item_tag = ItemTag.new
  end

  def create
    @item_tag = ItemTag.new(item_tag_params)
    if @item_tag.valid? 
      @item_tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    item_attributes = @item.attributes
    @item_tag = ItemTag.new(item_attributes)
  end

  def update
    @item_tag = ItemTag.new(item_tag_params)
    @item_tag.images ||= @item.images

    if @item_tag.valid?
      @item_tag.update(item_tag_params, @item)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_tag_params
    params.require(:item_tag).permit(:name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id,
                                 :ken_name_id, :days_to_ship_id, :price, :tag_name,{ images: [] }).merge(user_id: current_user.id)
  end

  # def item_tag_params
    # params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id,
      # :ken_name_id, :days_to_ship_id, :price, :tag_name,{ images: [] }).merge(user_id: current_user.id)
  # end


  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    elsif @item.is_active == false
      redirect_to action: :index
    end
  end
end
