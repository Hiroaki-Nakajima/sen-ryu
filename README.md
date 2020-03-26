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

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explain|text|null: false|
|postage|integer|null: false|
|region|string|null: false|
|state|string|nill: false|
|size|integer|
|category_id|integer|null: false|
|user_id|integer|null: false|

### Association
- has_many :images
- belongs_to :user
- belongs_to :category


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :item
- belongs_to :size


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :category


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string|

### Association
- has_many :items
- has_many :address
- belongs_to :person


## personsテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|year_birth_at|string|null: false|
|month_birth_at|string|null: false|
|day_birth_at|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|post_number|integer|null: false|
|city|string|null: false|
|town|string|null: false|
|building|string|

### Association
- belongs_to :user