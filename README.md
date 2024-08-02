# アプリケーション名
  Mission Possible

# アプリケーション概要
  目標と、そこに到達するまでのステップを設定するアプリです。ユーザー同士で共有することもできます。

# URL
  https://missionpossible-rails7.onrender.com/

# テスト用アカウント
  ・Basic認証ID：admin
  ・Basic認証パスワード：122333
  ・メールアドレス：cherry@gmail.com
  ・パスワード：333221

# 利用方法
## 目標投稿・レベル上げ
  ・トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う。
  ・ミッション設定ボタンから、ゴールと、３つのミッションを設定する。
  ・１つミッションを達成するごとに、「次のミッションへ進む」のボタンをクリックする。

## 応援メッセージ・アドバイス
  ・トップページ（一覧ページ）から、ユーザーの設定したゴールをクリックする。
  ・「応援メッセージ・アドバイス」の欄にコメントを入力し、「送信」をクリックする。
  

# アプリケーションを作成した背景
# 実装した機能についての画像やGIFおよびその他の説明
# 実装予定の機能
# データベース設計
# 画面遷移図
# 開発環境
# ローカルでの動作方法
# 工夫したポイント
# 改善点
# 制作時間
  およそ２週間です。




# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many :missions
- has_many :comments
- has_one  :levels

## missions テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| goal     | string     | null: false                    |
| mission1 | string     | null: false                    |
| mission2 | string     | null: false                    |
| mission3 | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

- has_many   :comments
- belongs_to :user

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     | null: false                    |
| mission  | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :comment

## levels テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| number   | integer    | null: false                    |
| user     | string     | null: false, foreign_key: true |

- belongs_to :user
