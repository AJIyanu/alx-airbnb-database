# Airbnb Clone - Text-based ER Diagram

This is a text-based ER diagram representing the normalized database structure for the Airbnb clone.

---

## Entity Relationship Diagram (ERD)

```
+------------+          +------------+          +------------+
|   states   |<---------|   cities   |<---------| properties |
|------------|          |------------|          |------------|
| state_id PK|          | city_id PK |          | property_id PK
| state_name |          | city_name  |          | host_id FK |
+------------+          | state_id FK|          | name       |
                        +------------+          | description|
                                                | city_id FK |
                                                | price_per_night
                                                | created_at |
                                                | updated_at |
                                                +------------+
                                                      |
                                                      v
                                                 +------------+
                                                 |   users    |
                                                 |------------|
                                                 | user_id PK |
                                                 | email      |
                                                 | password   |
                                                 | ...        |
                                                 +------------+

+------------+          +------------+          +------------+
|  bookings  |<---------|  payments  |          |  reviews   |
|------------|          |------------|          |------------|
| booking_id |          | payment_id |          | review_id  |
| user_id FK |          | booking_id |          | user_id FK |
| property_id|          | amount     |          | property_id|
| start_date |          | method     |          | rating     |
| end_date   |          +------------+          | comment    |
| total_price|                                  | created_at |
| status     |                                  +------------+
| created_at |
+------------+

                        +------------+
                        |  messages  |
                        |------------|
                        | message_id |
                        | sender_id  |
                        | recipient_id|
                        | message_body|
                        | sent_at     |
                        +------------+
```

---

## Notes

- All `PK` fields are primary keys.
- All `FK` fields are foreign keys.
- Arrows ( `<---------` ) represent one-to-many relationships.
- Users can be **hosts** or **guests** (indicated by `role`).
- `properties` belong to a `city`, which belongs to a `state`.
- `bookings` are linked to both `users` and `properties`.
- `payments` relate to `bookings`.
- `reviews` are linked to both `users` and `properties`.
- `messages` are between users (sender → recipient).

---

[Database Design from draw.io](https://drive.google.com/file/d/1Y7kZRWMZWD3I5_hcuOsvGuLAmY2WSxtP/view?usp=sharing)
