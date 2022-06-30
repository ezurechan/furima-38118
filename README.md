# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | --------------------------|
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last-name             | string  | null: false               |
| first_name            | string  | null: false               |
| lastname_kana         | string  | null: false               |
| firstname_kana        | string  | null: false               |
| birth_date            | integer | null: false               |



### Association

- has_many :items, orders
- has_one  :shipments


## items テーブル

| Column                   | Type    | Options                        |
| ------------------------ | ------- | ------------------------------ |
| item_name                | string  | null: false                    |
| item_info                | text    | null: false                    |
| item_category            | string  | null: false                    |
| item_sales_status        | string  | null: false, foreign_key: true |
| item_shipping_fee_status | string  | null: false, foreign_key: true |
| item_prefecture          | string  | null: false, foreign_key: true |
| item_scheduled_delivery  | integer | null: false, foreign_key: true |
| item_price               | integer | null: false, foreign_key: true |


### Association

- belongs_to :user

## orders テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| card_number    | integer | null: false |
| card-exp-month | integer | null: false |
| card-exp-year  | integer | null: false |
| card-cvc       | integer | null: false |
| postal_code    | integer | null: false |
| prefecture     | string  | null: false |
| city           | string  | null: false |
| building       | string  | null: false |
| phone_number   | integer | null: false |

### Association

- belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | references | null: false, foreign_key: true |
| last_name    | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| postal_code  | references | null: false, foreign_key: true |
| prefecture   | references | null: false, foreign_key: true |
| city         | references | null: false, foreign_key: true |
| building     | references | null: false, foreign_key: true |
| phone_number | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user