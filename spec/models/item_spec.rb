require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it "必須項目を入力した上で出品ができる" do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品がうまくいかないとき' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が必須であること" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "商品の説明が必須であること" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態についての情報が必須であること" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it "配送料の負担についての情報が必須であること" do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end

      it "発送元の地域についての情報が必須であること" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 0")
      end

      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格の範囲が、¥300~¥9,999,999の間であること" do  
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格の範囲が、¥0~¥299の間であること" do  
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "販売価格は半角数字のみ保存可能であること" do  
        @item.price = "９９９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
