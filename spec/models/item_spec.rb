require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録が出来るとき' do
      it 'imageとname、explanation、price、category_id、condition_id、burden_of_shipping_charges_id、ken_name_id、days_to_ship_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください', '価格は不正な値です')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '９８７'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが全角文字では登録できない' do
        @item.price = '九百十'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceの値が300未満だと登録できない' do
        @item.price = '99'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceの値が9999999を超えると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーが選択されていません')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態が選択されていません')
      end
      it 'burden_of_shipping_charges_idが空では登録できない' do
        @item.burden_of_shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担が選択されていません')
      end
      it 'ken_name_idが空では登録できない' do
        @item.ken_name_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域が選択されていません')
      end
      it 'days_to_ship-idが空では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数が選択されていません')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
