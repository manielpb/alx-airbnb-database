
-- USERS TABLE INDEXES
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_created_at ON users(created_at);

-- BOOKINGS TABLE INDEXES (Most Critical)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);
CREATE INDEX idx_bookings_dates_composite ON bookings(start_date, end_date);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_bookings_total_price ON bookings(total_price);

-- PROPERTIES TABLE INDEXES
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price_per_night ON properties(price_per_night);
CREATE INDEX idx_properties_created_at ON properties(created_at);
CREATE INDEX idx_properties_updated_at ON properties(updated_at);

-- REVIEWS TABLE INDEXES
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
CREATE INDEX idx_reviews_created_at ON reviews(created_at);

-- COMPOSITE INDEXES FOR COMMON QUERY PATTERNS
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);
CREATE INDEX idx_bookings_property_status ON bookings(property_id, status);
CREATE INDEX idx_properties_location_price ON properties(location, price_per_night);
CREATE INDEX idx_reviews_property_rating ON reviews(property_id, rating);
CREATE INDEX idx_reviews_property_created ON reviews(property_id, created_at);

-- Partial indexes for specific use cases
CREATE INDEX idx_bookings_active_status ON bookings(status) WHERE status IN ('confirmed', 'pending');
CREATE INDEX idx_users_active ON users(created_at) WHERE role != 'admin';

EXPLAIN ANALYZE
SELECT 
  bookings.booking_id, 
  users.first_name, 
  users.last_name, 
  properties.name, 
  bookings.start_date, 
  bookings.status
FROM bookings 
JOIN users  ON bookings.user_id = users.user_id
JOIN properties  ON bookings.property_id = properties.property_id
WHERE bookings.status = 'Confirmed'
ORDER BY bookings.start_date DESC;

