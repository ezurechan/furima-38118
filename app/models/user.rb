class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_FIRSTNAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :first_name, presence: true, format: { with: VALID_FIRSTNAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力する必要があります' }

  VALID_LASTNAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :last_name, presence: true, format: { with: VALID_LASTNAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力する必要があります' }

  VALID_LASTNAMEKANA_REGEX = /\A[ァ-ヴー]+\z/u.freeze
  validates :lastname_kana, presence: true, format: { with: VALID_LASTNAMEKANA_REGEX, message: 'は全角カタカナで入力する必要があります' }

  VALID_FIRSTNAMEKANA_REGEX = /\A[ァ-ヴー]+\z/u.freeze
  validates :firstname_kana, presence: true, format: { with: VALID_FIRSTNAMEKANA_REGEX, message: 'は全角カタカナで入力する必要があります' }

  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
end
