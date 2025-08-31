-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Emmanuel', 'Peprah', 'emmanuel@example.com', 'hashed_pw1', '0244123456', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Kwame', 'Mensah', 'kwame@example.com', 'hashed_pw2', '0244556677', 'host'),
('33333333-3333-3333-3333-333333333333', 'Ama', 'Boateng', 'ama@example.com', 'hashed_pw3', '0244987654', 'guest');

-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment in Accra', '2-bedroom apartment with WiFi and AC', 'Accra, Ghana', 70.00),
('55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'Beachfront Villa', 'Luxury villa with ocean view and pool', 'Cape Coast, Ghana', 200.00);

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('66666666-6666-6666-6666-666666666666', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '2025-09-05', '2025-09-07', 140.00, 'confirmed'),
('77777777-7777-7777-7777-777777777777', '55555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', '2025-09-10', '2025-09-13', 600.00, 'pending');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('88888888-8888-8888-8888-888888888888', '66666666-6666-6666-6666-666666666666', 140.00, 'credit_card'),
('99999999-9999-9999-9999-999999999999', '77777777-7777-7777-7777-777777777777', 600.00, 'paypal');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 5, 'Amazing apartment! Super clean and cozy.'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', 4, 'Beautiful villa with stunning view, but WiFi was slow.');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Kwame, is the apartment available for this weekend?'),
('dddddddd-dddd-dddd-dddd-dddddddddddd', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available. You can go ahead and book.');
