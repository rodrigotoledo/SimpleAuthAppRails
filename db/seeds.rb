User.create!(email: 'user@example.com', password: 'secret', password_confirmation: 'secret')
5.times do
  User.create!(email: Faker::Internet.email, password: 'secret', password_confirmation: 'secret')
end
