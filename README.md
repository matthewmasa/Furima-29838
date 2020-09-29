# README
| user_table |         |            |
|------------|---------|------------|
| column     | type    | option     |
| nick_name  | string  | null:false |
| email      | integer | null:false |
| password   | integer | null:false |
| birthday   | date    | null:false |

| Association      |
|------------------|
| ・has_many:items |
| ・has_one:orders |

| item_table    |         |                             |
|---------------|---------|-----------------------------|
| column        | type    | option                      |
| category_id   | integer | null:false                  |
| user_id       | integer | null:false forrign_key:true |
| name          | string  | null:false                  |
| text          | text    | null:false                  |
| price         | integer | null:false                  |
| shipping_area | string  | null:false                  |
| shipping_day  | date    | null:false                  |
| status        | boolean | null:false                  |

| Association        |
|--------------------|
| ・belongs_to: user |
| ・has_one: order   |

| order  |            |                             |
|--------|------------|-----------------------------|
| column | type       | option                      |
| user   | references | null:false foreign_key:true |
| item   | references | null:false foreign_key:true |

| Association        |
|--------------------|
| ・belongs_to: user |
| ・has_one: address |
| ・belongs_to:item  |


| address     |         |                             |
|-------------|---------|-----------------------------|
| column      | type    | option                      |
| user_id     | integer | null:false foreign_key:true |
| prefecture  | string  | null:false                  |
| city        | string  | null:false                  |
| home_number | integer | null:false                  |
| building    | string  |                             |
| telephone   | integer | null:false                  |

| Association         |
|---------------------|
| ・belongs_to:adress |

