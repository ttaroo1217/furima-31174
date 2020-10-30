# テーブル設計

## users テーブル

| Column               | Type   　| Options     |
| ---------------------| ------ 　| ----------- |
| nickname             | string 　| null: false |
| email                | string 　| null: false |
| encrypted_password   | string 　| null: false |
| first_name           | string 　| null: false |
| last_name            | string 　| null: false |
| first_name_kana      | string 　| null: false |
| last_name_kana       | string 　| null: false |
| birth_date           | date 　  | null: false |


  ### Association

  - has_many :items
  - has_many :item_orders


## items テーブル

| Column                  | Type   　     | Options           |
| ---------------------   | ------ 　     | -----------       |
| item_name         　　   | string 　     | null: false       |
| description             | text 　       | null: false       |
| user  (FK)        　　   | references 　 | foreign_key: true |
| category                | integer 　    | null: false       |
| status                  | integer 　    | null: false       |
| delivery_charge         | integer 　    | null: false       |
| area                    | integer　     | null: false       |
| days                    | integer　     | null: false       |
| price                   | integer　     | null: false       |

  ### Association

  - has_many :item_orders
  - belongs_to :user


## item_oder テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| card_number          | integer 　   | null: false       |
| exp_number           | integer 　   | null: false       |
| exp_year             | integer 　   | null: false       |
| security_code        | integer　    | null: false       |
| user  (FK)           | references 　| foreign_key: true |

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one :shipping_address


## shipping_address テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| postal_code          　| string 　   　| null: false       |
| prefecture           | integer　     | null: false       |
| city         | string　     | null: false       |
| house_number         | string　    | null: false       |
| building_name        | string　     | true      |
| phone_number         | string　    | null: false       |
| item_oder  (FK)    | references 　| foreign_key: true |


### Association

- belongs_to :item_oders
