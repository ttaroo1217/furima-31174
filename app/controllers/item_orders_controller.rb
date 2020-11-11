class ItemOrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create, :order_move_to_index]
  before_action :order_move_to_index, only: [:index]
  before_action :edit_move_to_index, only: [:index]
  
  

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
     if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
     else
       render action: :index
     end
  end

  private
  def order_params
   params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def order_move_to_index
    unless @item.item_order == nil
      return redirect_to root_path
    end
  end

  def edit_move_to_index
    if @item.user_id == current_user.id
      return redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy',
      )
  end
end
