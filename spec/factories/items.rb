FactoryBot.define do
  factory :item do
    name {Faker::Name.last_name}
    description {Faker::Lorem.sentence}
    category_id {3}
    status_id {4}
    delivery_charge_id {2}
    area_id {5}
    days_id {6}
    price {30000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end