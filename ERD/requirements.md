# Airbnb Clone – Database Design Documentation

## Overview

This document details the database design for the Airbnb Clone project, part of the ALX Backend Professional Developer curriculum. This design enables efficient data storage, retrieval, and integrity for a scalable Airbnb-like application.

## Learning Objectives

- Apply advanced principles of database design to model complex systems.
- Normalize data to optimize efficiency and minimize redundancy.
- Use SQL DDL to define schemas with appropriate constraints, keys, and indexing.
- Enhance collaboration through thorough documentation.

---

## Entity-Relationship Diagram (ERD)

The ERD below visualizes the main entities, their attributes, and relationships for the Airbnb Clone database.

> **Airbnb Clone Project ER Drawing.**
>
> ![ERD](https://github.com/ShadrackKaku/airbnb-clone-project/blob/main/ERD/airbnb_ER.drawio.svg)


---

## Entities and Attributes

### 1. User

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| user_id          | UUID            | Primary Key, Indexed                                |
| first_name       | VARCHAR         | NOT NULL                                            |
| last_name        | VARCHAR         | NOT NULL                                            |
| email            | VARCHAR         | UNIQUE, NOT NULL, Indexed                           |
| password_hash    | VARCHAR         | NOT NULL                                            |
| phone_number     | VARCHAR         | NULLABLE                                            |
| role             | ENUM            | ('guest','host','admin'), NOT NULL                  |
| created_at       | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |

---

### 2. Property

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| property_id      | UUID            | Primary Key, Indexed                                |
| host_id          | UUID            | Foreign Key → User(user_id), NOT NULL               |
| name             | VARCHAR         | NOT NULL                                            |
| description      | TEXT            | NOT NULL                                            |
| location         | VARCHAR         | NOT NULL                                            |
| pricepernight    | DECIMAL         | NOT NULL                                            |
| created_at       | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |
| updated_at       | TIMESTAMP       | ON UPDATE CURRENT_TIMESTAMP                         |

---

### 3. Booking

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| booking_id       | UUID            | Primary Key, Indexed                                |
| property_id      | UUID            | Foreign Key → Property(property_id), NOT NULL       |
| user_id          | UUID            | Foreign Key → User(user_id), NOT NULL               |
| start_date       | DATE            | NOT NULL                                            |
| end_date         | DATE            | NOT NULL                                            |
| total_price      | DECIMAL         | NOT NULL                                            |
| status           | ENUM            | ('pending','confirmed','canceled'), NOT NULL        |
| created_at       | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |

---

### 4. Payment

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| payment_id       | UUID            | Primary Key, Indexed                                |
| booking_id       | UUID            | Foreign Key → Booking(booking_id), NOT NULL         |
| amount           | DECIMAL         | NOT NULL                                            |
| payment_date     | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |
| payment_method   | ENUM            | ('credit_card','paypal','stripe'), NOT NULL         |

---

### 5. Review

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| review_id        | UUID            | Primary Key, Indexed                                |
| property_id      | UUID            | Foreign Key → Property(property_id), NOT NULL       |
| user_id          | UUID            | Foreign Key → User(user_id), NOT NULL               |
| rating           | INTEGER         | NOT NULL, CHECK (rating >= 1 AND rating <= 5)       |
| comment          | TEXT            | NOT NULL                                            |
| created_at       | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |

---

### 6. Message

| Attribute        | Type            | Constraints                                         |
|------------------|-----------------|-----------------------------------------------------|
| message_id       | UUID            | Primary Key, Indexed                                |
| sender_id        | UUID            | Foreign Key → User(user_id), NOT NULL               |
| recipient_id     | UUID            | Foreign Key → User(user_id), NOT NULL               |
| message_body     | TEXT            | NOT NULL                                            |
| sent_at          | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP                           |

---

## Relationships

- **User (host) → Property:** One-to-many (A host can list multiple properties)
- **User (guest) → Booking:** One-to-many (A guest can make multiple bookings)
- **Property → Booking:** One-to-many (A property can be booked multiple times)
- **Booking → Payment:** One-to-one (Each booking has one payment)
- **User → Review:** One-to-many (A user can write many reviews)
- **Property → Review:** One-to-many (A property can have many reviews)
- **User → Message:** One-to-many (A user can send and receive many messages)

**Foreign Key Summary:**
- `Property.host_id` → `User.user_id`
- `Booking.property_id` → `Property.property_id`
- `Booking.user_id` → `User.user_id`
- `Payment.booking_id` → `Booking.booking_id`
- `Review.property_id` → `Property.property_id`
- `Review.user_id` → `User.user_id`
- `Message.sender_id` → `User.user_id`
- `Message.recipient_id` → `User.user_id`

---

## Constraints

- **Primary Keys:** All primary key fields are indexed automatically.
- **Unique Constraints:**  
  - `User.email` must be unique.
- **Foreign Keys:**  
  - Each FK maintains referential integrity between tables.
- **Not Null Constraints:**  
  - All attributes marked NOT NULL must be provided on record creation.
- **Check Constraints:**  
  - `Review.rating` must be between 1 and 5.
- **ENUM Constraints:**  
  - `User.role`: Only 'guest', 'host', or 'admin'.
  - `Booking.status`: Only 'pending', 'confirmed', or 'canceled'.
  - `Payment.payment_method`: Only 'credit_card', 'paypal', or 'stripe'.
- **Indexing:**  
  - Primary keys are indexed by default.
  - Additional indexes:
    - `User.email`
    - `Property.property_id`
    - `Booking.booking_id`

---

## Indexing Strategy

- **Primary Indexes:** All primary keys.
- **Secondary Indexes:** 
  - `User.email` (for quick user lookup)
  - `Property.property_id` in Booking and Review tables (for fast filtering by property)
  - `Booking.booking_id` in Payment table (for fast payment retrieval)

---

## Normalization

This schema is normalized up to 3NF:
- No repeating groups or arrays (1NF).
- All non-key attributes are fully dependent on the primary key (2NF).
- No transitive dependencies (3NF).

---

## How to Use This Documentation

- **For Development:** Use this as the basis for DDL (CREATE TABLE) scripts.
- **For Collaboration:** Share with team members for understanding the data model.
- **For Assessment:** Submit as part of your project documentation for ALX.

---

## References

- [Draw.io - Free Online ERD Tool](https://draw.io)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [ALX Backend Curriculum](https://www.alxafrica.com/)

---

**Prepared by:**  
Shadrack Kaku  
Date: 2025-07-02
