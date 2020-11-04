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

| Column                  | Type        | Options           |
| ---------------------   | ------      | -----------       |
| name                    | string      | null: false       |
| description             | text        | null: false       |
| user  (FK)              | references  | foreign_key: true |
| category_id             | integer     | null: false       |
| status_id               | integer     | null: false       |
| delivery_charge_id      | integer     | null: false       |
| area_id                 | integer     | null: false       |
| days_id                 | integer     | null: false       |
| price                   | integer     | null: false       |

  ### Association

  - has_one :item_order
  - belongs_to :user


## item_oder テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| user  (FK)           | references 　| foreign_key: true |
| item  (FK)           | references 　| foreign_key: true |

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one :shipping_address


## shipping_address テーブル

| Column               | Type   　    | Options           |
| ---------------------| ------ 　    | -----------       |
| postal_code          | string 　    | null: false       |
| prefecture_id        | integer　    | null: false       |
| city                 | string　     | null: false       |
| house_number         | string　     | null: false       |
| building_name        | string　     |                   |
| phone_number         | string　     | null: false       |
| item_oder  (FK)      | references 　| foreign_key: true |


### Association

- belongs_to :item_oder
