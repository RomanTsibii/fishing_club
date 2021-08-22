# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(email: 'romanot70@gmail.com', password: '123456789', first_name: 'roman', last_name: 'tsibii')
admin.admin!
User.create(email: 'romanot71@gmail.com', password: '123456789', first_name: 'roman', last_name: 'tsibii')
