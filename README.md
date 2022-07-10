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
| date_of_birth      | data| null: false |

### Association

- has_many: items
- has_many: purchase_records
- has_many: shipping_addresses

## items テーブル

| Column          | Type       | Options                        |
| -----------     | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

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
- belongs_to: shipping_address 

## shipping_addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | integer    | null: false                   |
| city_name     | string     | null: false                   |
| block         | string     | null: false                   |
| building_name | string     |                               |
| block         | string     | null: false                   |
| user_id       | references | null:false, foreign_key: true |
| purchase_id   | references | null:false, foreign_key: true |

### Association
- belongs_to: user
- has_one: shipping_address
