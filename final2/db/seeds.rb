# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.delete_all
Location.delete_all
University.delete_all
Friendlist.delete_all
Event.delete_all

Location.create(id: '1', city: 'Chicago', state: 'IL')
Location.create(id: '2', city: 'New York City', state: 'NY')
Location.create(id: '3', city: 'San Francisco', state: 'CA')
Location.create(id: '4', city: 'Washington', state: 'DC')
Location.create(id: '5', city: 'Las Vegas', state: 'NV')
Location.create(id: '6', city: 'Austin', state: 'TX')
Location.create(id: '7', city: 'Dallas', state: 'TX')
Location.create(id: '8', city: 'Los Angeles', state: 'CA')
Location.create(id: '9', city: 'Boston', state: 'MA')
Location.create(id: '10', city: 'New Orleans', state: 'LA')
Location.create(id: '11', city: 'Princeton', state: 'NJ')
Location.create(id: '12', city: 'New Haven', state: 'CT')

University.create(id: '1', name: 'University of Chicago', color: '800000', location_id: 1)
University.create(id: '2', name: 'Northwestern University', color: '4E015C', location_id: 1)
University.create(id: '3', name: 'Harvard University', color: 'C90016', location_id: 9)
University.create(id: '4', name: 'Princeton University', color: 'FF8F00', location_id: 11)
University.create(id: '5', name: 'Stanford University', color: '8C1515', location_id: 3)
University.create(id: '6', name: 'Yale University', color: '0E4C92', location_id: 12)
University.create(id: '7', name: 'Columbia University', color: 'C4D8E2', location_id: 2)

User.create(id: '1', name: 'Will Boyer', email: 'wboyer@northwestern.edu', password: '123', university_id: 2, graduation_year: 2013, major: 'Mathematics', bio: 'I am a Maths Geek.', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '2', name: 'Alex Tsu', email: 'atsu@uchicago.edu', password: '123', university_id: 1, graduation_year: 2013, major: 'Computer Science', bio: 'CS4Lyfe', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '3', name: 'Taylor Swift', email: 'tswiz@harvard.edu', password: '123', university_id: 3, graduation_year: 2017, major: 'Music', bio: 'Blank space baby.', location_id: '8', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '4', name: 'Justin Bieber', email: 'jb1234@columbia.edu', password: '123', university_id: 7, graduation_year: 2015, major: 'Gender Studies', bio: 'Baby baby baby oh!', location_id: '7', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(id: '5', name: 'Sammy Smith', email: 'ssmith@uchicago.edu', password: '123', university_id: 1, graduation_year: 2014, major: 'English', bio: 'Sup.', location_id: '1', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '6', name: 'Jimmy Butler', email: 'jbutler@uchicago.edu', password: '123', university_id: 1, graduation_year: 2010, major: 'Psychology', bio: 'Ball is Life', location_id: '1', interested_in_hosting: 'no', interested_in_hanging_out: 'no')
User.create(id: '7', name: 'Stephen Curry', email: 'scurry@harvard.edu', password: '123', university_id: 3, graduation_year: 2010, major: 'Biology', bio: 'Splash bro', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '8', name: 'George Washington', email: 'prez@northwestern.edu', password: '123', university_id: 2, graduation_year: 2014, major: 'Political Science', bio: 'G dub in da house', location_id: '4', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

Friendlist.create(id: '1', requester_id: 1, friend_id: 7)
Friendlist.create(id: '2', requester_id: 2, friend_id: 3)
Friendlist.create(id: '3', requester_id: 3, friend_id: 4)
Friendlist.create(id: '4', requester_id: 4, friend_id: 5)
Friendlist.create(id: '5', requester_id: 5, friend_id: 2)
Friendlist.create(id: '6', requester_id: 6, friend_id: 8)

Event.create(id: 1, name: 'Partayy Chicago', university_id: 1, location_id: 1, address: '1234 Main St', start_time: DateTime.new(2015,6,20,17), end_time: DateTime.new(2015,6,20,18), description: 'Lets have some fun', organizer_contact_email: 'abcd@uchicago.edu')
Event.create(id: 2, name: 'Wildcats Foreverrrr', university_id: 2, location_id: 1, address: '5678 Halsted Ave',  start_time: DateTime.new(2015,5,21,17), end_time: DateTime.new(2015,5,21,22), description: 'Get your purple on, boys', organizer_contact_email: 'efg@northwestern.edu')

puts "Seeded succesfully."
