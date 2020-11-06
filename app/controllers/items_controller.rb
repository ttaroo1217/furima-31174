class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
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
    @item = Item.find(params[:id])
    unless  user_signed_in? && @item.user_id == current_user.id
      return redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end  
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

end
