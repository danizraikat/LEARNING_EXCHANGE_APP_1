# This file should contain all the record creation needed to seed the database with its default values.

admin = User.create!(username: "danizraikat", email: "dani@dani.com", password: "password", first_name: "Dani", bio: "Happy to be the first user of this website") 

user1 = User.create!(username: "gerrymathe", email: "gerry@gerry.com", password: "password", first_name: "Gerry", bio: "Happy to be the seocnd user of this website")

note1 = Note.create!(user_id:1, content: "This is the first note on the website")

comment1 = Comment.create!(user_id: 1, note_id: 1, content: "First comment")

tag1 = Tag.create!(title: "ruby") 