-- 1. INNER JOIN: Bookings and Users
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.full_name,
    users.email,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out
FROM
    bookings
INNER JOIN
    users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Properties and Reviews (ordered by property title, then review rating descending)
SELECT
    properties.id AS property_id,
    properties.title,
    reviews.id AS review_id,
    reviews.content AS review_content,
    reviews.rating
FROM
    properties
LEFT JOIN
    reviews ON properties.id = reviews.property_id
ORDER BY
    properties.title ASC,
    reviews.rating DESC;

    
-- 3. FULL OUTER JOIN: Users and Bookings
SELECT
    users.id AS user_id,
    users.full_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out
FROM
    users
FULL OUTER JOIN
    bookings ON users.id = bookings.user_id;
-- If your SQL engine does not support FULL OUTER JOIN, use this workaround:
-- SELECT users.id AS user_id, users.full_name, bookings.id AS booking_id, bookings.property_id, bookings.check_in, bookings.check_out
-- FROM users
-- LEFT JOIN bookings ON users.id = bookings.user_id
-- UNION
-- SELECT users.id AS user_id, users.full_name, bookings.id AS booking_id, bookings.property_id, bookings.check_in, bookings.check_out
-- FROM bookings
-- LEFT JOIN users ON bookings.user_id = users.id;