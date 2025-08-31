Normalization of AirBnB Database Design (to 3NF)

First Normal Form(1NF)
  Requirements: Every Column Should Have Single Values and a primary key
                User,Property, Booking, Payment, Review, Messsage all have atomic attributes and a primary key
  Conclusion: Tables are in 1NF

Second Normal Form(2NF)
  Requirements: * Meet 1NF Requirements
                * Eliminate Partial Dependencies
  Conclusion: Partial dependency is not possible since all tables depend on a primary key

Third Form (3NF)
Requirements: * Meet both 1NF and 2NF requirements 
              * There must be no transistive dependency for non-prime attributes
Analysis of each table
  * User
      1. All attributes in the user table depend only on user_id
      2. No transistive dependency
   
  * Property
      1. All attributes in the property table, except for host_id depend only on property_id
      2. host_id -> user(user_id)
      3. No transistive dependency
         
  * Booking
      1. All non-key attributes depends on booking_id

  * Payment
      1. All non-key attributes depends on payment_id

  * Review
      1. All non-key attributes depends on review_id

  * Message
      1. All non-key attributes depends on message_id
    
Conclusion: Table is in a 3NF
