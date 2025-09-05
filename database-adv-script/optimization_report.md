bookings → either a ref or ALL type depending on whether status has an index.
If no index, expect ALL (full table scan).
properties → same thing: if location is indexed, you’ll see ref; if not, ALL.
users → join via user_id. If user_id is indexed (usually primary key), you’ll see eq_ref (best case).
payments → join via booking_id. If indexed, it’ll also be ref or eq_ref; otherwise ALL.
Extra column in EXPLAIN will say things like Using where or Using join buffer (Block Nested Loop) if indexes are missing.

Ineffeciencies
1. bookings.status not indexed → forces full scan for filtering.
2. properties.location not indexed → forces full scan for filtering.
3. Joins on bookings.user_id, bookings.property_id, and payments.booking_id can be inefficient if those FK columns are not indexed.
4. Multiple ALL scans in EXPLAIN means poor scalability with bigger tables.
