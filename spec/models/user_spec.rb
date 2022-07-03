require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'emaiは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数字混合でなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    # it 'passwordが数字だけだと登録できない' do
    #   binding.pry
    #   @user.password ='11111111'
    #   @user.password_confirmation = '11111111'
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
    # end
    # it 'passwordが英字だけだと登録できない' do
    #   @user.password = 'aaaaaaaa'
    #   @user.password_confirmation = 'aaaaaaaa'
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    # end
  end
end
