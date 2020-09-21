require 'rails_helper'
describe UserOrder do
  describe '商品購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end 

    context '商品購入がうまくいく時' do
      it 'user_orderフォームの内容が全て正しく存在する時' do
        expect(@user_order).to be_valid
      end
      it 'user_orderフォームの内容がbuildingだけ空の場合' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '購入情報の出品者idがないと購入できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it '購入情報の商品idがないと購入できない' do
        @user_order.product_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に「-」が入っていないと購入できない' do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が数字以外だと購入できない' do
        @user_order.postal_code = "１２３-４５６７"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空だと購入できない' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture is not a number")
      end
      it '市区町村が空だと購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が数字以外だと購入できない' do
        @user_order.phone_number = "０８０１２３４５６７８"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号にハイフンがあると購入できない' do
        @user_order.phone_number = "080-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁以上だと購入できない' do
        @user_order.phone_number = "080123456789"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end