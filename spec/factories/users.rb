# FactoryBot.define do
#   factory :user do
#     name {Faker::Name.last_name}
#     email {Faker::Internet.free_email}
#     password = Faker::Internet.password(min_length: 6)
#     password {password}
#     password_confirmation {password}
#   end
# end

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.last_name}
    nickname {Faker::Name.last_name}
    nickname {Faker::Name.last_name}
    nickname {Faker::Name.last_name}
    nickname {Faker::Name.last_name}
  end
end