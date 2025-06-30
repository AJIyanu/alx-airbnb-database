# SQL Joins Practice for Airbnb Clone Project

This document contains solutions to SQL join queries, designed to help master different types of joins in preparation for the Airbnb clone project.

## 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings

```sql
SELECT bookings.*, users.*
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
```

- This query returns only bookings that have a matching user.

## 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews

```sql
SELECT properties.*, reviews.*
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
```

- This query returns all properties, with review data if available. Properties without reviews will still appear, with review columns as NULL.

## 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

```sql
SELECT users.*, bookings.*
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
```

- This query returns all users and all bookings, including users without bookings and bookings not linked to any user.

---

These queries demonstrate the use of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN, which are essential for building complex data relationships in the Airbnb clone
