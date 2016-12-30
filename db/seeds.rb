@user = User.create(email: "adam@test.com", password: "qwerty", password_confirmation: "qwerty", first_name: "Adam", last_name: "Malyn")

puts "1 user created"

50.times do |book|
  Book.create!(author: "#{book} author", title: "#{book} title", description: "#{book} description")
end

puts "50 Books have been created"
