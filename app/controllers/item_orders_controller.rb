class ItemOrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :order_move_to_index, only: [:index]
  before_action :edit_move_to_index, only: [:index]
  

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
     if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy',
      )
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
    @item = Item.new
    @item = Item.find(params[:item_id])
    unless @item.item_order == nil
      return redirect_to root_path
    end
  end

  # def move_to_login
  #   if user_signed_in?
  #     return redirect_to new_user_session_path
  #   end
  # end

  def edit_move_to_index
    if @item.user_id == current_user.id
      return redirect_to root_path
    end
  end

end
