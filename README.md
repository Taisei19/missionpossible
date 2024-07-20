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
