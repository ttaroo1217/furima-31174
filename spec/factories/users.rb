FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}  
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"太郎"}
    last_name {"山田"}
    first_name_kana {"タロウ"}
    last_name_kana {"ヤマダ"}
    birth_date {"19871217"}
    # association :order_form
  end
end