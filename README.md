## Build API's for a Reservation management for restaurants using Ruby on rails as back end.

### Rules:

a. Restaurants operate in shifts for example - Morning shift - 9 am to 1 pm, Evening shift - 6pm to 11 pm — Shift end time can’t be less then the start time

b. There will be tables in restaurants with table name, minimum and maximum number of guests that can sit on them.

c. There should be a guest entity in the system with name and email. — guest must always have name and email. The API shouldn’t accept invalid email formats

d. There should be a restaurant entity in the system with name, email and phone. — restaurant must always have name, phone and email. The API shouldn’t accept invalid phone or email formats

### API's

#### Create an API endpoint that creates a reservation for the guest in a restaurant. The API should accept 

  •	The table for reservation 
  
  •	The restaurant shift in which you want the reservation, reservation time - reservation time must lie within restaurant shift start time and end time 
  
  •	Guest who made the reservation, guest count for the reservation - the guest count must be between maximum and minimum capacity of the table selected for reservation 
  
	• When the reservation is created the guest should receive an email with reservation details.
  
  •	When the reservation is created the restaurant should receive an email with guest details.

#### Create an API endpoint that updates the reservation - when the reservation details are changed, the guest should receive an email with - old and updated reservation time, old and updated guest count.

#### Create an API end point that returns a list of reservations for a restaurant. Reservation should have these fields - Reservation time, guest count, guest name, table name



[Solution](https://github.com/aswin-ryuk/reservation_management/blob/master/public/restaurant%20management%20api%20test%20evidence.docx)
