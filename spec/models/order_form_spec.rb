require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    buy = FactoryBot.create(:user)
    sell = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: sell.id, item_id: item.id)
  end
  
  it "必須項目を入力したら商品を購入することができる" do
    expect(@order_form.valid?).to eq true
  end
  
  it "配送先の情報として、郵便番号が必須であること" do
    @order_form.postal_code = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
  end

  it "配送先の情報として、都道府県の選択が必須であること" do
    @order_form.prefecture_id = 0
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
  end

  it "配送先の情報として、市区町村が必須であること" do
    @order_form.city = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("City can't be blank")
  end

  it "配送先の情報として、番地が必須であること" do
    @order_form.house_number = nil
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("House number can't be blank")
  end

  it "配送先の情報として、電話番号が必須であること" do
    @order_form.phone_number = ""
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
  end

  it "郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと" do
    @order_form.postal_code = '1234567'
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Postal code is invalid")
  end

  it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
    @order_form.phone_number = '080-123456'
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Phone number is not a number")
  end

  it "クレジットカードの情報は必須であること" do
    @order_form.token = ''
    @order_form.valid?
    expect(@order_form.errors.full_messages).to include("Token can't be blank")
  end
end