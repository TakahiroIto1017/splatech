# アプリケーション概要

## 名称

SplaTech

## 機能

- プロフィール画像の生成
Switch用ゲーム「スプラトゥーン3」のフレンド募集に使えるプロフィール画像を生成できます。

## URL

https://splatech.onrender.com

### Basic認証

- ID
admin

- Pass
5656

# 利用方法

## プロフ画像メーカー

1. トップページ中央のボタンから左上の「プロフ画像メーカー」を選択
1. 名前を入力（その他の項目は任意）
[![Image from Gyazo](https://i.gyazo.com/217426b299b638ba64ae4789626bf0ad.png)](https://gyazo.com/217426b299b638ba64ae4789626bf0ad)
1. 「生成」ボタンを押す
1. 「画像を保存」ボタンを押す
[![Image from Gyazo](https://i.gyazo.com/5ad6d3d1d79945ffbd465618dadc3ce2.png)](https://gyazo.com/5ad6d3d1d79945ffbd465618dadc3ce2)

# アプリケーション作成の背景

ゲームが好きで、前職でもゲーム攻略メディアの編集業に就いていました。中でもスプラトゥーンというゲームが好きで、数百時間プレイしています。スプラトゥーンは4対4のチームゲームですが、一緒にプレイする友人を探す機能に乏しいという欠点があります。1000万人以上居るであろうスプラトゥーンのユーザーに100％、120％プレイを楽しんでもらいたいと考え、フレンド探しやユーザー同士のコミュニケーションを促進できるアプリケーションを開発しはじめました。

# 実装予定の機能

- フレンド掲示板機能
- ブキ診断機能
- 戦績管理機能
- 各機能とユーザー管理機能の連携

# 画面遷移図（未実装機能も含む）

[![Image from Gyazo](https://i.gyazo.com/b08ac8cc584b9e89181cd8c164d6b387.png)](https://gyazo.com/b08ac8cc584b9e89181cd8c164d6b387)

# データベース設計

## ER図

[![Image from Gyazo](https://i.gyazo.com/f8c1ed624347c8688407a1a12d1bb876.png)](https://gyazo.com/f8c1ed624347c8688407a1a12d1bb876)

## テーブル設計

### profiles テーブル

| Column             | Type    | Options                   | Memo       |
| ------------------ | ------- | ------------------------- | ---------- |
| name               | string  | null: false               |            |
| profile            | text    |                           |            |
| policy_id          | integer |                           | ActiveHash |
| skill_id           | integer |                           | ActiveHash |
| xp                 | integer |                           | 500~9999   |
| background_id      | integer |                           | ActiveHash |

### users テーブル

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

#### Association

- has_many :weapons, through: :user_weapons
- has_many :posts
- has_many :comments

### user_weapons テーブル

| Column    | Type       | Options                        | Memo       |
| --------- | ---------- | ------------------------------ | ---------- |
| role_id   | integer    | null: false                    | ActiveHash |
| user_id   | references | null: false, foreign_key: true |            |
| weapon_id | references | null: false, foreign_key: true |            |

#### Association

- belongs_to :user
- belongs_to :weapon

### weapons テーブル

| Column     | Type    | Options     | Memo       |
| ---------- | ------- | ----------- | ---------- |
| name       | string  | null: false |            |
| main_id    | integer |             | ActiveHash |
| sub_id     | integer |             | ActiveHash |
| special_id | integer |             | ActiveHash |

#### Association

- has_many :users, through: :user_weapons

### posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments

### comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

#### Association

- belongs_to :post
- belongs_to :user

# 開発記録

## 開発環境
### フロントエンド
- HTML
- CSS
### バックエンド
- Ruby
### フレームワーク
- Ruby on rails 6.0.0
  画像生成にgem 'mini_magick'を利用
### エディタ
- VSCode

## ログ
- 2024/04/08：開発開始
- 2024/04/10：ユーザー管理機能実装
- 2024/04/12：プロフ画像メーカー機能実装
- 2024/04/15～：プロフ画像メーカー機能改良中