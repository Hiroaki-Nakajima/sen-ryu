# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Name
  - 川柳.com (senryu.com)

* URL
  - http://18.180.186.227/

* Overview
  - 川柳&画像投稿型SNS
  - ログイン機能
  - 他ユーザーの投稿へのコメント機能
  - キーワード検索機能
  - 気に入った川柳へのいいね機能
  - いいね数によるランキング表示機能
  - 気に入ったユーザーのフォロー機能

* Intention
  - IT技術を利用した日本文化の発展
  - 幅広い年齢層の参画できるプラットフォーム作成

* DEMO
  - 川柳投稿
  ![dc344b1296a63701a049a1c5358d905b](https://user-images.githubusercontent.com/60601764/77885387-ec6ba480-72a1-11ea-8935-0784aabb8a29.gif)
  - いいね機能
  ![e64eaca9c7245c127abe0a845106b36e](https://user-images.githubusercontent.com/60601764/77885368-e1b10f80-72a1-11ea-9363-ea16375427ef.gif)
  - コメント機能
  ![583ea7b05dfd7b58c74a3fee0afb23ab](https://user-images.githubusercontent.com/60601764/77885402-f097c200-72a1-11ea-8109-7719c26ddaa5.gif)
  - 通知機能
  ![86da361d4e7d16dd9b8dd4b10d21a4dc](https://user-images.githubusercontent.com/60601764/77885426-f55c7600-72a1-11ea-9125-64b2f3b536a3.gif)
  - フォロー機能
  ![7d08e0298a7801ed6a87ac3ae0187b61](https://user-images.githubusercontent.com/60601764/77885436-f7bed000-72a1-11ea-8ef2-d3f0efc8e6a6.gif)

* TO be implemented
  - コメント機能の非同期通信化
  - SNSからのログイン機能

* Database

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string|

### Association
has_many :posts, dependent: :destroy
has_many :comments
has_many :likes, dependent: :destroy
has_many :liked_posts, through: :likes, source: :post

has_many :relationships
has_many :followings, through: :relationships, source: :follow
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :reverse_of_relationships, source: :user

has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


## postsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|
|user_id|integer|null: false|foreign_key: true|

### Association
belongs_to :user
has_many :comments
has_many :likes
has_many :liked_users, through: :likes, source: :user
has_many :notifications, dependent: :destroy


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|integer|null: false|foreign_key: true|
|post_id|integer|null: false|foreign_key: true|

### Association

belongs_to :user
belongs_to :post
has_many :notifications, dependent: :destroy


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false|foreign_key: true|
|user_id|integer|null: false|foreign_key: true|

### Association
belongs_to :post
belongs_to :user


## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|foreign_key: true|
|follow_id|integer|null: false|foreign_key: true|

### Association
belongs_to :user
belongs_to :follow, class_name: 'User'


## notificationsテーブル

|Column|Type|Options|
|------|----|-------|
|visitor_id|integer|null: false|foreign_key: true|
|visited_id|integer|null: false|foreign_key: true|
|post_id|integer|foreign_key: true|
|comment_id|integer|foreign_key: true|
|action|string|null: false|foreign_key: true|
|checked|integer|null: false|foreign_key: true|

### Association
belongs_to :post, optional: true
belongs_to :comment, optional: true
belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true