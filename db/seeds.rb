# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
users = [
  {
    email: "angler.ashley@example.com",
    password: "trout123",
    password_confirmation: "trout123",
    first_name: "Ashley",
    last_name: "Thompson",
    username: "ashley_trout",
    county: "Bay",
    bio: "Avid fly fisher who loves chasing trout in mountain streams. Always looking for the next big catch."
  },
  {
    email: "basshunter.bob@example.com",
    password: "bigbass",
    password_confirmation: "bigbass",
    first_name: "Bob",
    last_name: "Carter",
    username: "bass_hunter",
    county: "Jefferson",
    bio: "Bass fishing fanatic and tournament competitor. Sharing tips and tricks for reeling in the big ones."
  },
  {
    email: "marina.maria@example.com",
    password: "saltfish",
    password_confirmation: "saltfish",
    first_name: "Maria",
    last_name: "Lopez",
    username: "marina_maria",
    county: "Monroe",
    bio: "Saltwater angler specializing in snapper and grouper. Loves spending weekends on the boat."
  },
  {
    email: "catfish.chris@example.com",
    password: "cat123",
    password_confirmation: "cat123",
    first_name: "Chris",
    last_name: "Johnson",
    username: "catfish_chris",
    county: "Franklin",
    bio: "Night fishing enthusiast who enjoys catching catfish in calm rivers. Sharing bait and rigging tips."
  },
  {
    email: "pike.pro.paul@example.com",
    password: "pikepro",
    password_confirmation: "pikepro",
    first_name: "Paul",
    last_name: "Miller",
    username: "pike_pro_paul",
    county: "Lake",
    bio: "Northern pike expert who loves ice fishing and trolling. Always looking for the next trophy fish."
  }
]

# Save to database
users.each do |user_data|
  User.create!(user_data)
end