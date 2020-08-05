# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|date|null: false|
|birthday_month|date|null: false|
|birthday_day|date|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :address
- has_one :credit_cards

## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false|
|name|string|null: false, index: true|
|price|integer|null: false|
|explain|text|null: false|
|status|string|null: false|
|postage|integer|null: false|
|prefecture|string|null: false|
|shipping_date|string|null: false|
|brand_id|string| |
### Association
- has_many :likes
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text| |
### Association
- belongs_to :user
- belongs_to :item

## Categoriesテーブル]

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|string| |
### Association
- has_many :items

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## Credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_company|string	null: false|
|card_number|string|null: false|
|card_year|integer|null: false|
|card_month|integer|null: false|
|card_pass|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_no|string| |
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string| |
### Association
- belongs_to :user

## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key:true|
|image|string|null: false|
### Association
- belongs_to :item

## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string| |
### Association
- has_many :items

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
