require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      order = Order.create(user_id: user.id, item_id: item.id)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id, order_id: order.id)
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
        expect(@order_shipping_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.post_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'ken_nameを選択していないと保存できないこと' do
        @order_shipping_address.ken_name_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Ken name can't be blank")
      end
       
      it 'city_nameが空だと保存できないこと' do
        @order_shipping_address.city_name = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City name can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @order_shipping_address.block = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でなければ保存できないこと' do
        @order_shipping_address.phone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数値でなければ保存できないこと' do
        @order_shipping_address.phone_number = '１２３４５６７８９１０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'orderが紐付いていないと保存できないこと' do
        @order_shipping_address.order_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Order can't be blank")
      end
    end
  end
end