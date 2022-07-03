FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aaa000' }
    password_confirmation { password }
    last_name             { 'たぬき' }
    first_name            { '太郎' }
    lastname_kana         { 'タヌキ' }
    firstname_kana        { 'タロウ' }
    birth_date            { '1909-02-03' }
  end
end
