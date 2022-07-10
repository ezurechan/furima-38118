require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id , item_id: item.id)
  end
  


  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
    end
    it 'addressesは空でも保存できること' do
      @order_form.addresses = ''
      expect(@order_form).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @order_form.building = ''
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_form.item_prefecture_id  = '1'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Item prefecture can't be blank"
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_form.phone_number = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'userが紐付いていないと保存できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
  end

end
