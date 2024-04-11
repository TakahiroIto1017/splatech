# テーブル設計

## profiles テーブル

| Column             | Type    | Options                   | Memo       |
| ------------------ | ------- | ------------------------- | ---------- |
| name               | string  | null: false               |            |
| profile            | text    |                           |            |
| policy_id          | integer |                           | ActiveHash |
| skill_id           | integer |                           | ActiveHash |
| xp                 | integer |                           | 500~9999   |
| background_id      | integer |                           | ActiveHash |

## users テーブル

| Column             | Type    | Options                   | Memo       |
| ------------------ | ------- | ------------------------- | ---------- |
| email              | string  | null: false, unique: true |            |
| encrypted_password | string  | null: false               |            |
| name               | string  | null: false               |            |
| profile            | text    |                           |            |
| policy_id          | integer |                           | ActiveHash |
| skill_id           | integer |                           | ActiveHash |
| xp                 | integer |                           | 500~9999   |
| background_id      | integer |                           | ActiveHash |

### Association

- has_many :weapons, through: :user_weapons
- has_many :posts
- has_many :comments

## user_weapons テーブル

| Column    | Type       | Options                        | Memo       |
| --------- | ---------- | ------------------------------ | ---------- |
| role_id   | integer    | null: false                    | ActiveHash |
| user_id   | references | null: false, foreign_key: true |            |
| weapon_id | references | null: false, foreign_key: true |            |

### Association

- belongs_to :user
- belongs_to :weapon

## weapons テーブル

| Column     | Type    | Options     | Memo       |
| ---------- | ------- | ----------- | ---------- |
| name       | string  | null: false |            |
| main_id    | integer |             | ActiveHash |
| sub_id     | integer |             | ActiveHash |
| special_id | integer |             | ActiveHash |

### Association

- has_many :users, through: :user_weapons

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user