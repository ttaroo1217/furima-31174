class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]
  # before_action :order_move_to_index, only: [:edit]
  

  def index
    # @item_order = ItemOrder.new
    @items = Item.includes(:user).order("created_at DESC")
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
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
    unless  user_signed_in? && @item.user_id == current_user.id
      return redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end  
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      return redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def order_move_to_index
  #   unless @item.item_order == nil
  #     return redirect_to root_path
  #   end
  # end

end
