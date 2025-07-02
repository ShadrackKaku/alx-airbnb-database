# Database Normalization – Airbnb Clone

## Introduction

This document explains the normalization process applied to the Airbnb Clone database schema. The goal is to ensure the schema is in Third Normal Form (3NF), which eliminates redundancy, improves data integrity, and optimizes storage.

---

## Step 1: Unnormalized Data (UNF)

Suppose an unnormalized table for bookings looked like this:

| booking_id | guest_name | guest_email | property_name | host_name | start_date | end_date | payment_amount | payment_method |
|------------|------------|-------------|---------------|-----------|------------|----------|---------------|---------------|
| ...        | ...        | ...         | ...           | ...       | ...        | ...      | ...           | ...           |

**Issues:**  
- Repeating and grouped data (guest info, host info, property, payment) are all mixed.
- Redundant storage (guest and host details repeated for every booking).

---

## Step 2: First Normal Form (1NF)

**1NF Requirements:**  
- Each table cell contains a single value (atomicity).
- Each record is unique.

**Action:**  
- Split data so that each cell contains only a single value.
- Separate grouped data into individual columns.

**Result:**  
The original schema already uses atomic values.

---

## Step 3: Second Normal Form (2NF)

**2NF Requirements:**  
- It must first be in 1NF.
- Remove partial dependencies; non-key attributes must depend on the whole primary key.

**Action:**  
- Identify composite keys and remove partial dependencies.
- In the Airbnb schema, all tables use single-attribute primary keys (UUIDs).
- Move repeating info (guest, host, property, payment) to separate tables.

**Result:**  
Our design separates data into these tables:
- `User` (guest and host info)
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`

Each non-key attribute depends on the full primary key of its table.

---

## Step 4: Third Normal Form (3NF)

**3NF Requirements:**  
- Must be in 2NF.
- No transitive dependencies; non-key attributes depend only on the primary key.

**Action:**  
- Ensure no non-key attribute is dependent on another non-key attribute.
- Example: In the `Booking` table, attributes like `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at` all depend directly on `booking_id`.
- No attribute is dependent on another non-key attribute.

**Result:**  
All tables satisfy 3NF.

---

## Final Tables (after normalization)

### User

- user_id (PK)
- first_name
- last_name
- email (unique)
- password_hash
- phone_number
- role
- created_at

### Property

- property_id (PK)
- host_id (FK → User)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### Booking

- booking_id (PK)
- property_id (FK → Property)
- user_id (FK → User)
- start_date
- end_date
- total_price
- status
- created_at

### Payment

- payment_id (PK)
- booking_id (FK → Booking)
- amount
- payment_date
- payment_method

### Review

- review_id (PK)
- property_id (FK → Property)
- user_id (FK → User)
- rating
- comment
- created_at

### Message

- message_id (PK)
- sender_id (FK → User)
- recipient_id (FK → User)
- message_body
- sent_at

---

## Summary

- The database schema has been reviewed and normalized up to 3NF.
- All repeating groups, partial dependencies, and transitive dependencies have been eliminated.
- Each table contains only attributes that depend on its primary key.
- This approach optimizes data integrity, reduces redundancy, and supports scalable, efficient queries.

---

**Prepared by:**  
Shadrack Kaku  
Date: 2025-07-02