require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it '全ての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceに数字以外は登録できない' do
        @item.item_price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'item_priceは300以上しか登録できない' do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it 'item_priceは9,999,999以下しか登録できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'item_category_idを選択しないと登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it 'item_prefecture_idを選択しないと登録できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item prefecture can't be blank"
      end
      it 'item_sales_status_idを選択しないと登録できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end
      it 'item_scheduled_delivery_idを選択しないと登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end
      it 'item_shipping_fee_status_idを選択しないと登録できない' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee status can't be blank"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
