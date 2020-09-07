require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload("/files/ヤギ1.jpg")
  end

  describe '商品出品' do
    context '商品出品がうまく行く時' do
      it "user_id、name、description、price、category_id、condition_id、postage_type_id、prefectures_id、preparation_days_idが存在すれば出品できる" do
        user = FactoryBot.create(:user)
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it '商品画像:imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名:nameが空だと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明:descriptionが空だと出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー:category_idが空だと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態:condition_idが空だと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
      end
      it '配送料の負担:postage_type_idが空だと出品できない' do
        @product.postage_type_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage type is not a number")
      end
      it '発送元の地域:prefectures_idが空だと出品できない' do
        @product.prefectures_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefectures is not a number")
      end
      it '発送までの日数:preparation_days_idが空だと出品できない' do
        @product.preparation_days_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Preparation days is not a number")
      end
      it '価格:priceが空だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格:priceが¥299以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end
      it '価格:priceが¥10000000以上だと出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '価格:priceが半角数字以外だと出品できない' do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

    end

  end

end
