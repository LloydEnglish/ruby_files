# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Generating sample posts"

30.times do |n|
	User.create(email: "jb@user.com#{n}", 
		        password: "Jack" , 
		        password_confirmation: "Jack", 
		        username: "Jack #{n}")
puts "User #{n} created"
end