50.times do |book|
  Book.create!(author: "#{book} author", title: "#{book} title", description: "#{book} description")
end

puts "50 Books have been created"
