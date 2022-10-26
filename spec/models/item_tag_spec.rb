require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  describe '商品登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      @item_tag = FactoryBot.build(:item_tag, user_id: user.id) 
      @item_tag.images = item.images
    end

  
    context '商品登録が出来るとき' do
      it 'imagesとname、explanation、price、category_id、condition_id、burden_of_shipping_charges_id、ken_name_id、days_to_ship_id, tag_nameが存在すれば登録できる' do
        expect(@item_tag).to be_valid
      end
    end

    context '商品登録ができないとき' do
      it 'imagesが空では登録できない' do
        @item_tag.images = nil
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'nameが空では登録できない' do
        @item_tag.name = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('商品名を入力してください')
      end
      it 'explanationが空では登録できない' do
        @item_tag.explanation = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'priceが空では登録できない' do
        @item_tag.price = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('価格は数値で入力してください', '価格は不正な値です')
      end
      it 'priceが全角数字では登録できない' do
        @item_tag.price = '９８７'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが全角文字では登録できない' do
        @item_tag.price = '九百十'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceの値が300未満だと登録できない' do
        @item_tag.price = '99'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceの値が9999999を超えると登録できない' do
        @item_tag.price = '10000000'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'category_idが空では登録できない' do
        @item_tag.category_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('カテゴリーが選択されていません')
      end
      it 'condition_idが空では登録できない' do
        @item_tag.condition_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('商品の状態が選択されていません')
      end
      it 'burden_of_shipping_charges_idが空では登録できない' do
        @item_tag.burden_of_shipping_charges_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('配送料の負担が選択されていません')
      end
      it 'ken_name_idが空では登録できない' do
        @item_tag.ken_name_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('発送元の地域が選択されていません')
      end
      it 'days_to_ship-idが空では登録できない' do
        @item_tag.days_to_ship_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('発送までの日数が選択されていません')
      end
      it 'tag_nameがなければ登録できない' do
        @item_tag.tag_name = ""
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('タグを入力してください')
      end
      it 'userが紐付いていなければ出品できない' do
        @item_tag.user_id = ""
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
