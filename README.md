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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|kana_name|string|null: false|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|integer|null: false|
|profile|text|null: false|
|tel|integer|
|postal_code|integer|null: false|
|region|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|payment_way|string|null: false|
|identity_information_id|integer|null: false, foreign_key: true|

### Association
- has_many :products
- has_many :orders
- has_many :todo_lists
- has_many :sales
- has_many :transfer_applications
- has_many :points
- has_many :contacts
- has_many :news
- has_many :informations
- has_many :likes
- has_many :comments
- belongs_to :bank_account
- belongs_to :identity_infomations


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|user_id|integer|null: false, foreign_key: true|
|price|integer|null: false,index: true|
|image|text|null: false|
|large_category_id|integer|null: false, foreign_key: true,index: true|
|middle_category_id|integer|null: false, foreign_key: true,index: true|
|small_category_id|integer|null: false, foreign_key: true,index: true|
|brand_id|integer|null: false, foreign_key: true,index: true|
|size|string|null: false,index: true|
|state|string|null: false,index: true|
|delivery_fee|integer|null: false,index: true|
|delivery_way|string|null: false|
|delivery_from|string|null: false|
|delivery_time|string|null: false|
|details|text|
|likes_count|integer|
|sold|boolean|default: false,index: true|

### Association
- has_many :likes
- has_many :comments
- belongs_to :brands
- belongs_to :small_cateory
- belongs_to :middle_category
- belongs_to :large_category
- belongs_to :orders
- belongs_to :users

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- has_many :informations
- belongs_to :users
- belongs_to :products, counter_cache: :likes_count

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- has_many :informations
- belongs_to :users
- belongs_to :products


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|


### Association
- has_many :products


## small_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|small_category|string|null: false|
|middle_category_id|integer|null: false, foreign_key: true|


### Association
- has_many :products
- belongs_to :middle_categorys

## middle_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|middle_category|string|null: false|
|large_category_id|integer|null: false, foreign_key: true|


### Association
- has_many :products
- has_many :small_categorys
- belongs_to :large_categorys

## large_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|large_category|string|null: false|


### Association
- has_many :products
- has_many :middle_categorys

## identity_informationテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana_name|string|null: false, foreign_key: true|
|birthday|integer|null: false, foreign_key: true|
|confirmation_document|text|null: false|
|postal_code|integer|
|region|string|
|city|string|
|street|string|
|building|string|

### Association
- belongs_to :users

## informationsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|point_id|integer|null: false, foreign_key: true|
|order_id|integer|null: false, foreign_key: true|
|sale_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, foreign_key: true|
|checked|boolean|default: false|

### Association
- belongs_to :users
- belongs_to :likes
- belongs_to :order
- belongs_to :comments
- belongs_to :points
- belongs_to :news
- belongs_to :sales



## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false, foreign_key: true,index: true|
|buyer_id|integer|null: false, foreign_key: true,index: true|
|product_id|integer|null: false, foreign_key: true|
|product_name|string|null: false|
|product_image|string|null: false|
|price|integer|null: false|
|use_point|integer|null: false|
|payment|integer|null: false|
|payment_way|string|null: false|
|delivery_fee|integer|unique: true|
|adress|string|null: false|
|sell_fee|integer|null: false|
|sell_gain|integer|
|buyer_rank|string|
|buyer_review|string|
|seller_rank|string|
|seller_reveiw|string|
|payment_check|boolean|
|delivery_check|boolean|

### Association
- has_many :todo_lists
- has_many :transaction_messages
- belongs_to :products
- belongs_to :users
- belongs_to :points
- has_many :informatinos

## transfer_applicatonsテーブル
|Column|Type|Options|
|------|----|-------|

|transfer_price|integer|null: false|
|transfer_applicaton_price|integer|null: false|
|sale_id|integer|null: false, foreign_key: true|
|transfer_fee|integer|null: false|
|bank_account_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :sales
- belongs_to :bank_account
- belongs_to :users

## salesテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false, foreign_key: true|
|reason|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|dead_line|integer|

### Association
- has_many :transfer_applicatons
- belongs_to :informatinos
- belongs_to :users

## transaction_messagesテーブル

|Column|Type|Options|
|------|----|-------|
|order_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|message|text|null: false|

### Association
- belongs_to :transaction_messages
- belongs_to :orders
- belongs_to :users

## todo_listsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|order_id|integer|null: false, foreign_key: true|
|content|text|null: false|
|transaction_message_id|integer|foreign_key: true|

### Association
- belongs_to :transaction_messages
- belongs_to :orders
- belongs_to :users


## contactsテーブル
|Column|Type|Options|
|------|----|-------|

|product_id|integer||
|position|string||
|content|text|null: false|
|category|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :news
- belongs_to :users

## bank_accountテーブル
|Column|Type|Options|
|------|----|-------|

|bank|string|null: false|
|account_type|string|null: false|
|branch_code|integer|null: false|
|account_number|integer|null: false|
|account_holder_sei|string|null: false|
|account_holder_mei|string|null: false|
|adress|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|identity_information_id|integer|null: false, foreign_key: true|

### Association
- has_many :transfer_applicatons
- belongs_to :users

## newsテーブル
|Column|Type|Options|
|------|----|-------|

|title|string|
|content|text|null: false|
|user_id|integer|foreign_key: true|
|contact_id|integer|foreign_key: true|
|information_id|integer|foreign_key: true|

### Association
- belongs_to :contacts
- belongs_to :informatinos
- belongs_to :users

## pointsテーブル

|Column|Type|Options|
|------|----|-------|

|point|integer|null: false|
|reason|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|dead_line|integer|null: false|

### Association
- belongs_to :users
- belongs_to :orders