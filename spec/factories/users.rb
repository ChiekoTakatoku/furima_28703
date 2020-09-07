FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@gmail.com' }
    password              { 'o0o0o0' }
    password_confirmation { password }
    first_name            { '山田' }
    family_name           { '太郎' }
    first_name_kana       { 'ヤマダ' }
    family_name_kana      { 'タロウ' }
    birthday              { '1999-02-28' }
  end
end
