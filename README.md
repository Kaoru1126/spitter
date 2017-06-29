# DB設計

## users table

| Column     | Type        | Options                                |
|------------|-------------|----------------------------------------|
| name       | string      | null: false, index: true, unique: true |
| mail       | string      | null: false, unique: true              |
| password   | string      | null: false                            |
| screenName | string      | null: false, unique: true              |
| intro      | string      |                                        |
| icon       | string      |                                        |
| birthday   | string      |                                        |
| place      | string      |                                        |

### Association

 - has_many : tweets
 - has_many : follows


## tweets table

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| content    | text        | null: false                    |
| image      | string      |                                |
| user_id    | integer     | null: false, foreign_key: true |
|            | integer     | null: false  foreign_key: true |

### Association

 - belongs_to : user


## follows table

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user_id    | integer     | null: false, foreign_key: true |
| group_id   | integer     | null: false, foreign_key: true |

### Association

 - belongs_to : user

