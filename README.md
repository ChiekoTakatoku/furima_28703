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

## アプリケーション名
furima_28703

## アプリケーション概要
誰でも簡単に出品・購入ができるフリマアプリ

## デプロイ先URL
https://furima-28703.herokuapp.com

## テスト用アカウント
BASIC_AUTH_PASSWORD:  9999
BASIC_AUTH_USER:  testman

## 利用方法
アカウントを作成することで、アプリケーション上での買い物と出品が可能となる。

## 目指した課題解決
自宅などにある不要になった物などを捨てずに、必要な人のもとへ届けることができる。それにより無駄なゴミを減らし、誰でも簡単にリサイクルをできるようにする。


# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birthday         | date    | null: false |

### Association

- has_many :products
- has_many :orders


## user_addressesテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| postal_code  | string  | null: false                    |
| prefecture   | integer | null: false                    |
| city         | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  |                                |
| phone_number | string  | null: false                    |

### Association

- belongs_to :order


## productsテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| image            | string  | null: false                    |
| description      | text    | null: false                    |
| price            | integer | null: false                    |
| user             | integer | null: false, foreign_key: true |
| category         | integer | null: false                    |
| condition        | integer | null: false                    |
| postage_type     | integer | null: false                    |
| prefecture       | integer | null: false                    |
| preparation_day  | integer | null: false                    |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| users_id    | integer | null: false, foreign_key: true |
| products_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :user_address