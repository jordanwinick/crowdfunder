# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do 
	User.create({
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		avatar: Faker::Avatar.image,
		email: Faker::Internet.email,
		password: 'password',
		password_confirmation: 'password'
		})

end

100.times do
	Project.create({
		name: Faker::App.name,
		description: Faker::Company.bs,
		goal: Faker::Number.number(4),
		start_date: Faker::Date.between(Date.today, 10.days.from_now),
		end_date: Faker::Date.between(11.days.from_now, 20.days.from_now),
		user: User.all.sample
		})
end

Project.all.each do |project|
	3.times do 
		project.rewards.create({
		title: Faker::Commerce.product_name,
		description: Faker::Company.bs,
		amount: Faker::Number.number(2),
		backer_limit: 10
		})
	end
end

