##  usersテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| date_of_birth      | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| name                          | string     | null: false                    |
| explanation                   | text       | null: false                    |
| category_id                   | integer    | null: false                    |
| condition_id                  | integer    | null: false                    |
| burden_of_shipping_charges_id | integer    | null: false                    |
| ken_name_id                   | integer    | null: false                    |
| days_to_ship_id               | integer    | null: false                    |
| price                         | integer    | null: false                    |
| is_active                     | boolean    | null: false                    |
| user                          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :tags
- has_many :item_tags_relations

## orders テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| user                 | references | null:false, foreign_key: true |
| item                 | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address 

## shipping_addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| ken_name_id        | integer    | null: false                   |
| city_name          | string     | null: false                   |
| block              | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |
| order              | references | null:false, foreign_key: true |

### Association
- belongs_to :order

## tags テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| tag_name           | string     | null: false                   |


### Association
- has_many :item_tag_relations
- has_many :items


## item_tag_relations テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item               | references | null:false, foreign_key: true |
| tag                | references | null:false, foreign_key: true |

### Association
- has_many :items
- has_many :tags
