# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

youtube_code_1 = %w[wNF8ZIrSDjI SwD7xHs9SSA 19BMMS7c1ts sUqnpax89Vc dVb0U3JUQ_0]
youtube_code_2 = %w[hAl5eRnQ9VQ 8HMIl9cN1dY 4fBX3PHTJjI iynrZATeW6g hInpBoLZCPA]
youtube_code_3 = %w[19BMMS7c1ts wUTVE-PRjd0 19BMMS7c1ts 2osHRxoxMo0 x8jO2fPZS6k]
youtube_code_4 = %w[o6KC8B70Q6s zSv4E0c3T0c vynKH6pdH6E 9LFxIYYAkos I9FAPIZRu90]
youtube_code_5 = %w[VZOcpgCLgEo 2XphNPJIhDs 03B_QwfdDFY 1qHD7prlVZQ hYp1dt4qur4]
youtube_code_6 = %w[eZOa-v1hvpM 3eBtgPJ7mWc OaDpaKPvvDM 8XBF8OX7RcU 55xeAW_GdyM]
3.times do |index|
  user = User.create!(email: "user_#{index+1}@test.com", password: [*'a'..'z'].sample(6).join)
  user.movies.new(name: Faker::Music.band, description: Faker::Lorem.paragraph_by_chars, youtube_code: eval("youtube_code_#{index+1}[0]")).save(validate: false)
  user.movies.new(name: Faker::Music.band, description: Faker::Lorem.paragraph_by_chars, youtube_code: eval("youtube_code_#{index+1}[1]")).save(validate: false)
  user.movies.new(name: Faker::Music.band, description: Faker::Lorem.paragraph_by_chars, youtube_code: eval("youtube_code_#{index+1}[2]")).save(validate: false)
  user.movies.new(name: Faker::Music.band, description: Faker::Lorem.paragraph_by_chars, youtube_code: eval("youtube_code_#{index+1}[3]")).save(validate: false)
  user.movies.new(name: Faker::Music.band, description: Faker::Lorem.paragraph_by_chars, youtube_code: eval("youtube_code_#{index+1}[4]")).save(validate: false)
end

50.times do
  Movie.all.sample.user_vote_ups.create!(user: User.all.sample)
  Movie.all.sample.user_vote_downs.create!(user: User.all.sample)
end
