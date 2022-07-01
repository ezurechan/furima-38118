# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | --------------------------|
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| lastname_kana         | string  | null: false               |
| firstname_kana        | string  | null: false               |
| birth_date            | date    | null: false               |



### Association

- has_many :items, orders
- has_one  :shipments


## items テーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| item_name                   | string     | null: false |
| item_info                   | text       | null: false |
| item_category_id            | string     | null: false |
| item_sales_status_id        | integer    | null: false |
| item_shipping_fee_status_id | integer    | null: false |
| item_prefecture_id          | integer    | null: false |
| item_scheduled_delivery_id  | integer    | null: false |
| item_price                  | integer    | null: false |
| user                        | references | null: false |

### Association

- belongs_to :user

## orders テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | integer | null: false |
| prefecture     | string  | null: false |
| city           | string  | null: false |
| building       | string  | null: false |
| phone_number   | integer | null: false |

### Association

- belongs_to :user

## shipments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |


### Association

- belongs_to :order
- belongs_to :item
- belongs_to :user