# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
User.create!(email: "raphael.alampay@gmail.com", password: "magisamdg", password_confirmation: "magisamdg")

EmployeeType.create!(name: "Type A", code: "T_A", base_salary: "20000", description: "Sample Type A Employee")
EmployeeType.create!(name: "Type B", code: "T_B", base_salary: "25000", description: "Sample Type B Employee")
