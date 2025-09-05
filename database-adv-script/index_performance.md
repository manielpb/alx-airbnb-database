1. Users Table
- User_id
  Used in JOIN with bookings and review
  Common in WHERE when fetching a user's booking
- email
  Often used in WHERE for login/authentication lookups.
- last_name/first_name
  Sometimes used in ORDER BY (alphabetical lists).
- High-usage: user_id, email, (last_name if sorting).

2. Bookings table
- booking_id
  Primary key, used in WHERE or for direct lookups.
- user_id
  Used in JOIN with users.
- property_id
  Used in JOIN with properties.
- start_date/end_date
  Used in WHERE for date filtering (e.g., availability, reports).
- status
  Common in WHERE filters (e.g., confirmed, pending).
- High-usage: booking_id, user_id, property_id, start_date, end_date, status.

3. Properties table
   - property_id
     Used in JOIN with bookings and reviews.
   - location
     Used in WHERE for searches (e.g., city, region).
     Sometimes in ORDER BY.
   - name
     Might appear in search (WHERE name LIKE ...).
   - High-usage: property_id, location, (name for searches).
