// a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT 
  user_id, first_name, last_name
COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings on users.user_id = bookings.user_id
GROUP BY users.user_id, users.first_name, users.last_name
ORDER BY total_bookings DESC;

// a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
WITH property_booking_stats AS (
    SELECT
        properties.property_id,
        properties.name AS property_name,
        properties.location,
        COUNT(bookings.booking_id) AS total_bookings
    FROM properties 
    LEFT JOIN bookings  ON properties.property_id = bookings.property_id
    GROUP BY properties.property_id, properties.name, properties.location
)
SELECT
    property_id,
    property_name,
    location,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank_row,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank_rank,
    DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank_dense
FROM property_booking_stats
ORDER BY total_bookings DESC;
