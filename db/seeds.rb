require 'faker'

5.times do
  password = Faker::Internet.password.unique
  User.where(email: Faker::Internet.email.unique).first_or_create(username: Faker::Internet.username, password: password, password_confirmation: password)
  p "created user"
end

