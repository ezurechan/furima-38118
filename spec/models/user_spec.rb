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
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'emailは@を含まないと登録できない' do
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
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
  end

  describe '新規登録/本人情報確認' do
    it 'お名前(全角)は、名字がないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'お名前(全角)は、名前がないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力ががそれぞれないと登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name は全角（漢字・ひらがな・カタカナ）で入力する必要があります"
    end

    it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力ががそれぞれないと登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name は全角（漢字・ひらがな・カタカナ）で入力する必要があります"
    end
    
    it 'お名前(全角カナ)は、名字がないと登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
    end
    it 'お名前(全角カナ)は、名前がないと登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
    end

    it '名字(全角カナ)は、全角カタカナでの入力がないと登録できない' do
      @user.lastname_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana は全角カタカナで入力する必要があります"
    end

    it '名前(全角カナ)は、全角カタカナでの入力がないと登録できない' do
      @user.firstname_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana は全角カタカナで入力する必要があります"
    end

    it ' 生年月日がないと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
  it '全ての値が存在すれば登録できる' do
    expect(@user).to be_valid
  end
end
