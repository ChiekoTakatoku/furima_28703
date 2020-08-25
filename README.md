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

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| id                   | integer | null: false |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| first_name           | string  | null: false |
| family_name          | string  | null: false |
| フリガナ(first_name)  | string  | null: false |
| フリガナ(family_name) | string  | null: false |
| birthday             | date    | null: false |

### Association

- has_many :users_credit_cards
- has_many :users_addresses
- has_many :products


## users_credit_cardsテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| users_id      | integer | null: false, foreign_key: true |
| number        | string  | null: false                    |
| expiratiom    | string  | null: false                    |
| security_code | integer | null: false                    |

### Association

- belongs_to :users
- has_one_attached :products


## users_addressesテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| users_id     | integer | null: false, foreign_key: true |
| postal_code  | string  | null: false                    |
| prefectures  | string  | null: false                    |
| city         | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  |                                |
| phone_number | string  | null: false                    |

### Association

- belongs_to :users
- has_one_attached :products
- belongs_to_active_hash :prefecture


## productsテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| id               | integer | null: false |
| name             | string  | null: false |
| image            | string  | null: false |
| description      | text    | null: false |
| price            | integer | null: false |
| user             | string  | null: false |
| category         | string  | null: false |
| condition        | string  | null: false |
| postage_type     | string  | null: false |
| prefectures      | string  | null: false |
| preparation_days | string  | null: false |

### Association

- belongs_to :users
- has_one_attached :users_credit_card
- has_one_attached :users_addresses