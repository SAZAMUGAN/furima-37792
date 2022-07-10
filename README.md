##  usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique:true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date_of_birth      | data   | null: false |

### Association

- has_many: items
- has_many: purchase_records

## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| explanation                | text       | null: false                    |
| category                   | string     | null: false                    |
| condition                  | string     | null: false                    |
| burden_of_shipping_charges | string     | null: false                    |
| shipping_area              | string     | null: false                    |
| days_to_ship               | string     | null: false                    |
| price                      | integer    | null: false                    |
| user_id                    | references | null: false, foreign_key: true |
| purchase_record_id         | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: purchase_record

## purchase_records テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| user_id              | references | null:false, foreign_key: true |
| item_id              | references | null:false, foreign_key: true |
| shipping_address_id  | references | null:false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: shipping_address 

## shipping_addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| ken_name           | string     | null: false                   |
| city_name          | string     | null: false                   |
| block              | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | integer    | null: false                   |
| purchase_record_id | references | null:false, foreign_key: true |

### Association
- belongs_to: purchase_record
