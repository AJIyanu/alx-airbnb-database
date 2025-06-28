
# Airbnb Clone Database Normalization (Up to 3NF)

This document explains the normalization process applied to the Airbnb clone database schema. The goal is to reduce redundancy, improve consistency, and ensure each table conforms to First (1NF), Second (2NF), and Third Normal Forms (3NF).

---

## 🧾 1. User Table

### Original
```sql
user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at
```

### Normalization Analysis
- ✅ **1NF**: All fields are atomic.
- ✅ **2NF**: All non-key columns depend entirely on the primary key (`user_id`).
- ✅ **3NF**: No non-key column depends on another non-key column.

### ✅ No changes needed.

---

## 🏠 2. Property Table

### Original
```sql
property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at
```

### Problem
- `location` is not atomic (likely includes city and state), which violates **1NF**.
- `location` can introduce transitive dependencies (e.g., `city → state`).

### Solution: Normalize location into separate tables

#### New Tables

**State**
```sql
state_id (PK), state_name
```

**City**
```sql
city_id (PK), city_name, state_id (FK)
```

**Property (Updated)**
```sql
property_id (PK), host_id (FK), name, description, city_id (FK), price_per_night, created_at, updated_at
```

### ✅ Now fully conforms to 3NF.

---

## 📅 3. Booking Table

### Original
```sql
booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at
```

### Normalization Analysis
- ✅ **1NF**: All fields are atomic.
- ✅ **2NF**: All fields depend on `booking_id`.
- ✅ **3NF**: `total_price` is treated as an independent value (can differ from property price).

### ✅ No changes needed.

---

## 💳 4. Payment Table

### Original
```sql
payment_id (PK), booking_id (FK), amount, payment_date, payment_method
```

### Normalization Analysis
- ✅ **1NF** and **2NF** satisfied.
- ⚠️ **3NF Risk**: If `amount` were always equal to `Booking.total_price`, it would violate 3NF.
- ✅ Decision: `amount` is treated as an independent fact (e.g., discounts, partial payments).

### ✅ No changes needed.

---

## ⭐ 5. Review Table

### Original
```sql
review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at
```

### Normalization Analysis
- ✅ Fully normalized to 3NF.
- All fields directly depend on the primary key.

### ✅ No changes needed.

---

## 💬 6. Message Table

### Original
```sql
message_id (PK), sender_id (FK), recipient_id (FK), message_body, sent_at
```

### Normalization Analysis
- ✅ All fields are atomic and directly dependent on the primary key.
- No partial or transitive dependencies.

### ✅ No changes needed.

---

## ✅ Final Normalized Tables

| Table    | Description |
|----------|-------------|
| User     | Stores user information |
| State    | Stores states |
| City     | Stores cities and links to states |
| Property | Linked to city and host, stores property info |
| Booking  | Stores reservations for properties |
| Payment  | Linked to bookings, stores amount and method |
| Review   | User feedback on properties |
| Message  | Communication between users |

---

## 🎯 Summary of Changes

| Table     | Change                       | Reason |
|-----------|------------------------------|--------|
| Property  | Extracted `location` into `City` and `State` tables | To eliminate transitive dependency and improve queryability |
| All Others| No changes                   | Already normalized |
