-- Airbnb Clone Database Sample Data

-- Insert Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Walker', 'alice@example.com', 'hash1', '1234567890', 'host', NOW()),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hash2', '2345678901', 'guest', NOW()),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Johnson', 'carol@example.com', 'hash3', NULL, 'guest', NOW()),
('44444444-4444-4444-4444-444444444444', 'David', 'Lee', 'david@example.com', 'hash4', '3456789012', 'host', NOW());

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Ocean View Apartment', '2 bedroom apartment with an ocean view.', 'Miami, FL', 150.00, NOW(), NOW()),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 'Downtown Loft', 'Modern loft in the city center.', 'New York, NY', 200.00, NOW(), NOW());

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-08-01', '2025-08-05', 600.00, 'confirmed', NOW()),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-08-10', '2025-08-12', 400.00, 'pending', NOW());

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 600.00, NOW(), 'credit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('ddddddd1-dddd-dddd-dddd-dddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing place, beautiful view!', NOW()),
('ddddddd2-dddd-dddd-dddd-dddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Nice location, but a bit noisy.', NOW());

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, is your apartment available for the weekend?', NOW()),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available. Let me know if you have questions.', NOW());