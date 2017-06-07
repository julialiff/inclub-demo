# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Administrador.create(idAdministrador, email, senha)

Faker::Config.locale = 'pt-BR'

99.times do |n|
  name = Faker::Name.first_name + "" + Faker::Name.last_name
  email = "#{name}@inclub.com"
  senha = 'ach2025'
  Administrador.create!(email: email,
                        senha: senha)
end
