# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Location.delete_all
University.delete_all
Friendlist.delete_all

Location.create(city: 'Chicago', state: 'IL')
Location.create(city: 'Miami', state: 'FL')
Location.create(city: 'Boston', state: 'MA')

University.create(name: 'University of Chicago', color: '800000')
University.create(name: 'Northwestern University', color: '4E015C')

User.create(email: 'jdoe@uchicago.edu', password: '123', university_id: 1, graduation_year: 2014, major: 'English', bio: 'I love cooking, sailing, and playing hockey.', location_id: '1', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(email: 'wwhite@northwestern.edu', password: 'pollos', university_id: 2, graduation_year: 2014, major: 'Chemistry', bio: 'I love driving cars and collecting minerals.', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(email: 'asmith@uchicago.edu', password: 'abc', university_id: 1, graduation_year: 2014, major: 'Philosophy', bio: 'I love baseball and tennis.', location_id: '3', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

Friendlist.create(creator_id: 1, friend_id: 2)
Friendlist.create(creator_id: 1, friend_id: 3)
Friendlist.create(creator_id: 2, friend_id: 1)