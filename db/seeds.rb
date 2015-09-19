# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Parent.delete_all
Address.delete_all
Student.delete_all

user = User.create!(
	name: 'dave',
	password: 'secret',
	password_confirmation: 'secret'
)

address	= Address.create!(
	street: '1112 Cheshire Circle',
	city: 'Danville',
	state: 'CA',
	zip: '94506'
)

dad = Parent.create!(
	first_name: 'david',
	last_name: 'chang',
	occupation: 'Software Engineer'
)

mom = Parent.create!(
	first_name: 'sophia',
	last_name: 'chang',
	occupation: 'Software Developer'
)

student =  Student.create!(
	first_name: 'craig',
	last_name: 'chang',
	grade: '1A',
	cell_phone_number: '925-915-0071',
	home_phone_number: '925-648-8388',
	email: 'craigchang@gmail.com',
	user: user,
	address: address,
)

student.parents << dad
student.parents << mom
