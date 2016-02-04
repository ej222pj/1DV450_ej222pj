# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "Admin", email: "admin@hotmail.se", password: "123456", password_confirmation: "123456")
User.create(username: "Eric", email: "eric@hotmail.se", password: "123456", password_confirmation: "123456")


Apikey .create(device: "Webb App", tmp_user_id: 3)
Apikey.create(device: "Better Webb App", tmp_user_id: 3)