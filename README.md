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
| year_of_birth        | integer　| null: false |
| year_of_month        | integer　| null: false |
| year_of_day          | integer　| null: false |

  ### Association

  - has_many :items
  - has_many :purchases
  - has_many :shipping_address


## items テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| product_name         | string 　    | null: false       |
| description          | text 　      | null: false       |
| user_id  (FK)        | references 　| foreign_key: true |
| category             | string 　    | null: false       |
| status               | string 　    | null: false       |
| delivery_charge      | string 　    | null: false       |
| area                 | string　     | null: false       |
| days                 | integer　    | null: false       |
| price                | integer　    | null: false       |
| shipping_id  (FK)    | references 　| foreign_key: true |


  ### Association

  - has_many :purchases
  - has_many :shipping_address
  - belongs_to :user

## purchase テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| card_number          | integer 　   | null: false       |
| exp_number           | integer 　   | null: false       |
| exp_year             | integer 　   | null: false       |
| security_code        | integer　    | null: false       |
| user_id  (FK)        | references 　| foreign_key: true |

  ### Association

  - belongs_to :user
  - has_many :items
  - has_one :shipping_address


## shipping_address テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| post_code          　| integer 　   | null: false       |
| prefecture           | string　     | null: false       |
| municipality         | string　     | null: false       |
| house_number         | integer　    | null: false       |
| building_name        | string　     | null: false       |
| phone_number         | integer　    | null: false       |
| user_id  　(FK)    　 |references 　| foreign_key: true |
| purchase_id  (FK)    | references 　| foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to :user
- belongs_to :item