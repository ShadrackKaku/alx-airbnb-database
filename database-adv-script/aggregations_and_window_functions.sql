-- 1. Find the total number of bookings made by each user
SELECT
    users.id AS user_id,
    users.full_name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.id,
    users.full_name;

-- 2. Rank properties based on the total number of bookings (most booked property is rank 1)
SELECT
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM
    properties p
LEFT JOIN
    bookings b ON p.id = b.property_id
GROUP BY
    p.id,
    p.title
ORDER BY
    booking_rank ASC;