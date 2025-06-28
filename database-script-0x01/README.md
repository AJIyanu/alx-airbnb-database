# Database Schema for AIRBNB_CLONE

This `schema.sql` file defines the relational database structure for a property booking and rental platform. It includes tables for users, properties, bookings, payments, reviews, and messaging, along with supporting tables for geographical data (states and cities).

## Table of Contents

- [Overview](#overview)
- [Tables](#tables)
  - [Users](#users)
  - [States](#states)
  - [Cities](#cities)
  - [Properties](#properties)
  - [Bookings](#bookings)
  - [Payments](#payments)
  - [Reviews](#reviews)
  - [Messages](#messages)
- [Indexes](#indexes)
- [Usage](#usage)

## Overview

The schema is designed to support the core functionalities of a property rental application, including:

- User management (guests, hosts, admins)
- Property listings with geographical details
- Booking management
- Payment processing
- User reviews for properties
- Internal messaging between users

## Tables

### Users

Stores information about platform users, including their roles (guest, host, admin).

| Column          | Type                             | Constraints                 | Description                    |
| :-------------- | :------------------------------- | :-------------------------- | :----------------------------- |
| `user_id`       | `UUID`                           | `PRIMARY KEY`               | Unique identifier for the user |
| `first_name`    | `VARCHAR`                        | `NOT NULL`                  | User's first name              |
| `last_name`     | `VARCHAR`                        | `NOT NULL`                  | User's last name               |
| `email`         | `VARCHAR`                        | `UNIQUE`, `NOT NULL`        | User's email address           |
| `password_hash` | `VARCHAR`                        | `NOT NULL`                  | Hashed password                |
| `phone_number`  | `VARCHAR`                        | `NULLABLE`                  | User's phone number            |
| `role`          | `ENUM('guest', 'host', 'admin')` | `NOT NULL`                  | User's role on the platform    |
| `created_at`    | `TIMESTAMP`                      | `DEFAULT CURRENT_TIMESTAMP` | Timestamp of user creation     |

### States

Stores geographical state names.

| Column       | Type      | Constraints   | Description                     |
| :----------- | :-------- | :------------ | :------------------------------ |
| `state_id`   | `UUID`    | `PRIMARY KEY` | Unique identifier for the state |
| `state_name` | `VARCHAR` | `NOT NULL`    | Name of the state               |

### Cities

Stores city names and their associated states.

| Column      | Type      | Constraints                                   | Description                       |
| :---------- | :-------- | :-------------------------------------------- | :-------------------------------- |
| `city_id`   | `UUID`    | `PRIMARY KEY`                                 | Unique identifier for the city    |
| `city_name` | `VARCHAR` | `NOT NULL`                                    | Name of the city                  |
| `state_id`  | `UUID`    | `NOT NULL`, `FOREIGN KEY` (`states.state_id`) | Foreign key to the `states` table |

### Properties

Stores details about properties available for rent.

| Column            | Type        | Constraints                                             | Description                             |
| :---------------- | :---------- | :------------------------------------------------------ | :-------------------------------------- |
| `property_id`     | `UUID`      | `PRIMARY KEY`                                           | Unique identifier for the property      |
| `host_id`         | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`users.user_id`)             | Foreign key to the `users` table (host) |
| `name`            | `VARCHAR`   | `NOT NULL`                                              | Name of the property                    |
| `description`     | `TEXT`      | `NOT NULL`                                              | Detailed description of the property    |
| `city_id`         | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`cities.city_id`)            | Foreign key to the `cities` table       |
| `price_per_night` | `DECIMAL`   | `NOT NULL`                                              | Price per night for the property        |
| `created_at`      | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP`                             | Timestamp of property creation          |
| `updated_at`      | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | Last update timestamp                   |

### Bookings

Manages property booking information.

| Column        | Type                                       | Constraints                                          | Description                              |
| :------------ | :----------------------------------------- | :--------------------------------------------------- | :--------------------------------------- |
| `booking_id`  | `UUID`                                     | `PRIMARY KEY`                                        | Unique identifier for the booking        |
| `property_id` | `UUID`                                     | `NOT NULL`, `FOREIGN KEY` (`properties.property_id`) | Foreign key to the `properties` table    |
| `user_id`     | `UUID`                                     | `NOT NULL`, `FOREIGN KEY` (`users.user_id`)          | Foreign key to the `users` table (guest) |
| `start_date`  | `DATE`                                     | `NOT NULL`                                           | Start date of the booking                |
| `end_date`    | `DATE`                                     | `NOT NULL`                                           | End date of the booking                  |
| `total_price` | `DECIMAL`                                  | `NOT NULL`                                           | Total price for the booking              |
| `status`      | `ENUM('pending', 'confirmed', 'canceled')` | `NOT NULL`                                           | Current status of the booking            |
| `created_at`  | `TIMESTAMP`                                | `DEFAULT CURRENT_TIMESTAMP`                          | Timestamp of booking creation            |

### Payments

Records payment transactions for bookings.

| Column           | Type                                      | Constraints                                       | Description                         |
| :--------------- | :---------------------------------------- | :------------------------------------------------ | :---------------------------------- |
| `payment_id`     | `UUID`                                    | `PRIMARY KEY`                                     | Unique identifier for the payment   |
| `booking_id`     | `UUID`                                    | `NOT NULL`, `FOREIGN KEY` (`bookings.booking_id`) | Foreign key to the `bookings` table |
| `amount`         | `DECIMAL`                                 | `NOT NULL`                                        | Amount paid                         |
| `payment_date`   | `TIMESTAMP`                               | `DEFAULT CURRENT_TIMESTAMP`                       | Timestamp of payment                |
| `payment_method` | `ENUM('credit_card', 'paypal', 'stripe')` | `NOT NULL`                                        | Method of payment                   |

### Reviews

Stores user reviews and ratings for properties.

| Column        | Type        | Constraints                                          | Description                                 |
| :------------ | :---------- | :--------------------------------------------------- | :------------------------------------------ |
| `review_id`   | `UUID`      | `PRIMARY KEY`                                        | Unique identifier for the review            |
| `property_id` | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`properties.property_id`) | Foreign key to the `properties` table       |
| `user_id`     | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`users.user_id`)          | Foreign key to the `users` table (reviewer) |
| `rating`      | `INTEGER`   | `NOT NULL`, `CHECK (rating >= 1 AND rating <= 5)`    | Rating from 1 to 5                          |
| `comment`     | `TEXT`      | `NOT NULL`                                           | Review comment                              |
| `created_at`  | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP`                          | Timestamp of review creation                |

### Messages

Handles internal messaging between users.

| Column         | Type        | Constraints                                 | Description                                  |
| :------------- | :---------- | :------------------------------------------ | :------------------------------------------- |
| `message_id`   | `UUID`      | `PRIMARY KEY`                               | Unique identifier for the message            |
| `sender_id`    | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`users.user_id`) | Foreign key to the `users` table (sender)    |
| `recipient_id` | `UUID`      | `NOT NULL`, `FOREIGN KEY` (`users.user_id`) | Foreign key to the `users` table (recipient) |
| `message_body` | `TEXT`      | `NOT NULL`                                  | Content of the message                       |
| `sent_at`      | `TIMESTAMP` | `DEFAULT CURRENT_TIMESTAMP`                 | Timestamp when message was sent              |

## Indexes

Indexes are created on frequently queried columns to improve database performance.

- `idx_users_email` on `users(email)`
- `idx_properties_host_id` on `properties(host_id)`
- `idx_properties_city_id` on `properties(city_id)`
- `idx_bookings_property_id` on `bookings(property_id)`
- `idx_bookings_user_id` on `bookings(user_id)`
- `idx_payments_booking_id` on `payments(booking_id)`
- `idx_reviews_property_id` on `reviews(property_id)`
- `idx_reviews_user_id` on `reviews(user_id)`
- `idx_messages_sender_id` on `messages(sender_id)`
- `idx_messages_recipient_id` on `messages(recipient_id)`
