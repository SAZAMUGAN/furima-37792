require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item_tag = FactoryBot.create(:item_tag)
      order = Order.create(user_id: user.id, item_id: item.id)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipping_address.post_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は不正な値です')
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.post_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'ken_nameに「---」が選択されている場合は保存できないこと' do
        @order_shipping_address.ken_name_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('都道府県が選択されていません')
      end

      it 'city_nameが空だと保存できないこと' do
        @order_shipping_address.city_name = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'blockが空だと保存できないこと' do
        @order_shipping_address.block = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号を入力してください', '電話番号は不正な値です')
      end
      it '電話番号が9桁以下では購入できない' do
        @order_shipping_address.phone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_shipping_address.phone_number = '123456789012'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが半角数値でなければ保存できないこと' do
        @order_shipping_address.phone_number = '１２３４５６７８９１０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('商品を入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('トークンを入力してください')
      end
    end
  end
end
