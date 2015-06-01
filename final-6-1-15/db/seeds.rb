# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.delete_all
Location.delete_all
University.delete_all
Event.delete_all
EventSignup.delete_all


Location.create(id: '1', city: 'Cambridge', state: 'MA', description: "Cambridge is a city in Middlesex County, Massachusetts, United States, in the Boston metropolitan area, situated directly north of the city of Boston proper, across the Charles River. It was named in honor of the University of Cambridge in England, an important center of the Puritan theology embraced by the town's founders. Cambridge is home to two of the world's most prominent universities, Harvard University and the Massachusetts Institute of Technology. ")

Location.create(id: '2', city: 'Princeton', state: 'NJ', description: "Princeton is a municipality with a borough form of government in Mercer County, New Jersey, United States, that was established in its current form on January 1, 2013, through the consolidation of the Borough of Princeton and Princeton Township. Princeton was founded before the American Revolution and is best known as the location of Princeton University, located in the community since 1756. Princeton is roughly equidistant from New York City and Philadelphia. Princeton is close to many major highways that serve both cities, and receives major television and radio broadcasts from each.")

Location.create(id: '3', city: 'New Haven', state: 'CT', description: "New Haven was founded in 1638 by English Puritans, and a year later eight streets were laid out in a four-by-four grid, creating what is now commonly known as the 'Nine Square Plan', now recognized by the American Institute of Certified Planners as a National Planning Landmark. The central common block is New Haven Green, a 16-acre (6 ha) square, now a National Historic Landmark and the center of Downtown New Haven. New Haven is the home of Yale University. The university is an integral part of the city's economy, being New Haven's biggest taxpayer and employer.")

Location.create(id: '4', city: 'Philadelphia', state: 'PA', description: "In 1682, William Penn founded the city to serve as capital of the Pennsylvania Colony. During the American Revolution, Philadelphia played an instrumental role as a meeting place for the Founding Fathers of the United States, who signed the Declaration of Independence in 1776 and the Constitution in 1787. Following numerous civil rights protests and riots, the city experienced decades of heavy crime and neared bankruptcy by the 1980s. Revitalization began in the 1990s, with gentrification turning around many neighborhoods and reversing its decades-long trend of population loss.")

Location.create(id: '5', city: 'New York', state: 'NY', description: "New York City or the City of New York to distinguish it from the State of New York, of which it is a part – is the most populous city in the United States and the center of the New York metropolitan area, the premier gateway for legal immigration to the United States. Many districts and landmarks in New York City have become well known, and the city received a record 56 million tourists in 2014, hosting three of the world's ten most visited tourist attractions in 2013. Several sources have ranked New York the most photographed city in the world.")

Location.create(id: '6', city: 'Hanover', state: 'NH', description:"Hanover is a town along the Connecticut River in Grafton County, New Hampshire, United States. The population was 11,260 at the 2010 census. CNN and Money magazine rated Hanover the sixth best place to live in America in 2011, and the second best in 2007. Dartmouth College and the US Army Corps of Engineers Cold Regions Research and Engineering Laboratory are located there. The Appalachian Trail crosses the town." )

Location.create(id: '7', city: 'Ithaca', state: 'NY', description: "The city of Ithaca sits on the southern shore of Cayuga Lake, in Central New York. It is named for the Greek island of Ithaca. Ithaca is home to Cornell University, an Ivy League school of over 20,000 students, most of whom study on Cornell’s Ithaca campus.")

Location.create(id: '8', city: 'Providence', state: 'RI', description: "Providence is the capital and most populous city in Rhode Island. Founded in 1636, it is one of the oldest cities in the United States. It is located in Providence County, and is the third-largest city in the New England region after Boston and Worcester. Providence was founded by Roger Williams, a religious exile from the Massachusetts Bay Colony. He named the area in honor of 'God's merciful Providence', which he believed was responsible for revealing such a haven for him and his followers to settle. After becoming one of the first cities in the country to industrialize, Providence became noted for its jewelry and silverware industry.")



University.create(id: '1', name: 'Harvard University', location_id: 1, description: "Harvard University is a private Ivy League research university in Cambridge, Massachusetts, established in 1636. Its history, influence and wealth have made it one of the most prestigious universities in the world. Harvard is a large, highly residential research university. The nominal cost of attendance is high, but the University's large endowment allows it to offer generous financial aid packages. It operates several arts, cultural, and scientific museums, alongside the Harvard Library, which is the world's largest academic and private library system, comprising 79 individual libraries with over 18 million volumes.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/3/3a/Harvard_Wreath_Logo_1.svg/193px-Harvard_Wreath_Logo_1.svg.png')

University.create(id: '2', name: 'Princeton University', location_id: 2, description: "Princeton University is a private Ivy League research university in Princeton, New Jersey. Founded in 1746 in Elizabeth as the College of New Jersey, Princeton was the fourth chartered institution of higher education in the American colonies and thus one of the nine Colonial Colleges established before the American Revolution. The institution moved to Newark in 1747, then to the current site nine years later, where it was renamed Princeton University in 1896.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/7/71/Princeton_shield.svg/340px-Princeton_shield.svg.png')

University.create(id: '3', name: 'Yale University', location_id: 3, description: "Yale University is a private Ivy League research university in New Haven, Connecticut. Founded in 1701 as the Collegiate School, the university is the third-oldest institution of higher education in the United States. In 1718, the school was renamed Yale College in recognition of a gift from Elihu Yale, a governor of the British East India Company. Yale College undergraduates follow a liberal arts curriculum with departmental majors and are organized into a system of residential colleges. Almost all faculty teach undergraduate courses, more than 2,000 of which are offered annually The Yale University Library, serving all twelve schools, holds more than 15 million volumes and is the third-largest academic library in the United States.", logo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Yale_University_Shield_1.svg/440px-Yale_University_Shield_1.svg.png')

University.create(id: '4', name: 'University of Pennsylvania', location_id: 4, description: "The University of Pennsylvania (commonly referred to as Penn or UPenn) is a private, Ivy League, research university located in Philadelphia. Incorporated as The Trustees of the University of Pennsylvania, Penn is one of 14 founding members of the Association of American Universities and one of the nine original Colonial Colleges. Penn has claims to being the oldest university in the United States of America. Benjamin Franklin, Penn's founder, advocated an educational program that focused as much on practical education for commerce and public service as on the classics and theology. The university coat of arms features a dolphin on the red chief, adopted directly from the Franklin family's own coat of arms.", logo_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/9/92/UPenn_shield_with_banner.svg/400px-UPenn_shield_with_banner.svg.png')

University.create(id: '5', name: 'Columbia University', location_id: 5, description: "Columbia University in the City of New York, or simply Columbia University, is a private Ivy League research university located in Morningside Heights, in Upper Manhattan, New York City. Columbia is the oldest institution of higher learning in New York state, the fifth oldest in the United States, and one of the country's nine Colonial Colleges founded before the American Revolution. It was founded in 1754 as King's College by royal charter of George II of Great Britain. After the American Revolutionary War, King's College briefly became a state entity, and was renamed Columbia College in 1784.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/e/e8/ColumbiaNYUCoat.svg/440px-ColumbiaNYUCoat.svg.png')

University.create(id: '6', name: 'Dartmouth College', location_id: 6, description: "Dartmouth College, commonly referred to as Dartmouth, is a private Ivy League research university located in Hanover, New Hampshire, United States. It consists of a liberal arts college, the Geisel School of Medicine, the Thayer School of Engineering, and the Tuck School of Business, as well as 19 graduate programs in the arts and sciences. Incorporated as the Trustees of Dartmouth College it is one of the nine Colonial Colleges founded before the American Revolution. With an undergraduate enrollment of 4,276 and a total student enrollment of 6,342 (as of 2013), Dartmouth is the smallest university in the Ivy League.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/e/e4/Dartmouth_College_shield.svg/440px-Dartmouth_College_shield.svg.png')

University.create(id: '7', name: 'Cornell University', location_id: 7, description: "Cornell University is an American private Ivy League and federal land-grant research university located in Ithaca, New York. Founded in 1865 by Ezra Cornell and Andrew Dickson White, the university was intended to teach and make contributions in all fields of knowledge — from the classics to the sciences, and from the theoretical to the applied. These ideals, unconventional for the time, are captured in Cornell's motto, a popular 1865 Ezra Cornell quotation: I would found an institution where any person can find instruction in any study.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/b/bc/Cornell_Seal.svg/452px-Cornell_Seal.svg.png')

University.create(id: '8', name: 'Brown University', location_id: 8, description: "Brown University is a private Ivy League research university in Providence, Rhode Island. Founded in 1764 as The College in the English Colony of Rhode Island and Providence Plantations, Brown is the seventh-oldest institution of higher education in the United States and one of the nine Colonial Colleges established before the American Revolution. At its foundation, Brown was the first college in the United States to accept students regardless of their religious affiliation. Its engineering program, established in 1847, was the first in what is now known as the Ivy League.", logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/0/07/BrownU-CoA.svg/340px-BrownU-CoA.svg.png')



User.create(id: '1', name: 'Alexander Tsu', email: 'alexander.tsu.14@dartmouth.edu', password: '123', university_id: 6, graduation_year: 2014, major: 'Economics', bio: 'Yo wassup. My name is Alex. I like design, spicy food, and the Golden State Warriors', location_id: '6', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '2', name: 'Tom Smith', email: 'tsmith@harvard.edu', password: '123', university_id: 1, graduation_year: 2014, major: 'Philosophy', bio: 'Nietzsche For the Win', location_id: '1', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '3', name: 'Ronald Miller', email: 'ronald.miller@princeton.edu', password: '123', university_id: 2, graduation_year: 2016, major: 'Public Policy', bio: 'FDR is the best prez of all time. OF ALL TIME!', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

User.create(id: '4', name: 'Felicia Garcia', email: 'fgarcia@yale.edu', password: '123', university_id: 3, graduation_year: 2017, major: 'Physics', bio: 'Bill Nye the science guy rocks', location_id: '3', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '5', name: 'James Nguyen', email: 'jnguyen1@wharton.upenn.edu', password: '123', university_id: 4, graduation_year: 2015, major: 'Finance & Marketing', bio: 'Dolla dolla bills yo', location_id: '4', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '6', name: 'Teddy Young', email: 'ty1234@colubmia.edu', password: '123', university_id: 5, graduation_year: 2013, major: 'Music', bio: 'Id catch a grenade for ya!', location_id: '5', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '7', name: 'Michael Harris', email: 'michael.harris@cornell.edu', password: '123', university_id: 7, graduation_year: 2014, major: 'Agriculture', bio: 'Nature = Life', location_id: '7', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '8', name: 'Davis Moore', email: 'davis.moore@brown.edu', password: '123', university_id: 8, graduation_year: 2014, major: 'Comparative Literature', bio: 'Find me in the library, bros', location_id: '8', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

User.create(id: '9', name: 'Dominick Thomas', email: 'dthomas2@harvard.edu', password: '123', university_id: 1, graduation_year: 2012, major: 'Mathematics', bio: 'Let me know if you want a job at the Goldman Sachs', location_id: '5', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

User.create(id: '10', name: 'Haley Lee', email: 'haley.lee@princeton.edu', password: '123', university_id: 2, graduation_year: 2013, major: 'Operations Research and Financial Engineering', bio: '$$$ kids', location_id: '5', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

User.create(id: '11', name: 'Emily Clark', email: 'emily.clark@brown.edu', password: '123', university_id: 8, graduation_year: 2013, major: 'Electrical Engineering', bio: 'Just got the Google Glass. Let me know if you want to try them on', location_id: '5', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

User.create(id: '12', name: 'Jane Hansen', email: 'jane.hansen1@brown.edu', password: '123', university_id: 8, graduation_year: 2012, major: 'Anthropology & Art History', bio: 'If you like ramen, I can show you to the best NYC has to offer', location_id: '5', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')

User.create(id: '13', name: 'Walker Green', email: 'walker.green@brown.edu', password: '123', university_id: 8, graduation_year: 2013, major: 'Chemistry', bio: 'Science rules', location_id: '5', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')


Event.create(id: 1, name: 'Brown takes over the Pub', creator_id: 13, university_id: 8, location_id: 5, address: '1234 5th Ave, New York, NY', start_time: DateTime.new(2015,6,20,12), end_time: DateTime.new(2015,6,20,14), description: 'Just come out and hang out with me and the Brown crew', organizer_contact_email: 'walker.green@brown.edu')

Event.create(id: 2, name: 'New York Annual Inter-Ivy', creator_id: 6, university_id: 5, location_id: 5, address: '5678 12th St, New York, NY',  start_time: DateTime.new(2015,7,3,18), end_time: DateTime.new(2015,7,3,22), description: 'Annual Inter-Ivy Mixer taking place on July 3rd. Come out and meet new people', organizer_contact_email: 'ty1234@colubmia.edu')


EventSignup.create(id: 1, user_id: 13, event_id: 1)
EventSignup.create(id: 2, user_id: 12, event_id: 1)
EventSignup.create(id: 3, user_id: 11, event_id: 1)
EventSignup.create(id: 4, user_id: 6, event_id: 2)
EventSignup.create(id: 5, user_id: 9, event_id: 2)
EventSignup.create(id: 6, user_id: 13, event_id: 2)
EventSignup.create(id: 7, user_id: 10, event_id: 2)




puts "Seeded succesfully."
