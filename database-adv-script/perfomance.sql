-- Initial complex query: Retrieve all bookings with user, property, and payment details
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id;

-- Analyze the query's performance before optimization
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id;

-- Refactored/optimized query example:
-- 1. Only select necessary columns (if possible)
-- 2. Use EXISTS or WHERE filters if narrowing down by date, user, etc.
-- 3. Ensure that indexes exist on booking.user_id, booking.property_id, payments.booking_id

-- Example optimized query (if you want only active payments):
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed';

-- Analyze the query's performance after optimization
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed';