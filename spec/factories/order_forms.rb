FactoryBot.define do
  factory :order_form do
    postal_code { '112-0013' }
    prefecture_id { 1 }
    city { '東京都渋谷区' }
    house_number { '渋谷1-1-1' }
    building_name { '森ビル' }
    phone_number { '12345678912' }
    token { 'asljdvpasdvcka' }

    association :user
    association :item
  end
end
