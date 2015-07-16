# This file should contain all the record creation needed to seed the database with its default values.

admin1 = User.create!(username: "admin1", email: "admin@admin.com", password: "passwordadmindani", first_name: "First", last_name: "Admin", bio: "I am the admin and I can do anything I want here. I see everything, I hear everything and I eat (almost) everything.") 
# user2 = User.create!(username: "gerrymathe", email: "gerry@gerry.com", password: "password", first_name: "Gerry", last_name: "Mathe", bio: "Happy to be the seocnd user of this website")
# user3 = User.create!(username: "alexpchin", email: "alex@alex.com", password: "password", first_name: "Alex", last_name: "Chin", bio: "Happy to be the THIRD user of this website")

note1 = Note.create!(user_id: 1, content: "This is a Note. We use notes to communicate our discoveries about code. You can write anything you want here but try to keep its content relevant to the community and concise.")

# note2 = Note.create!(user_id: 2, content: "Today I learnt about CSS")
# note3 = Note.create!(user_id: 3, content: "Today I learnt about JS")   

comment1 = Comment.create!(user_id: 1, note_id: 1, content: "This is a comment. We can use comments to ask questions, say 'Thank you!' and elaborate in more details on what we posted in our notes.")

# comment2 = Comment.create!(user_id: 2, note_id: 1, content: "Well done")
# comment3 = Comment.create!(user_id: 3, note_id: 1, content: "Add me on LinkedIn")

# tag1 = Tag.create!(title: "trello")
# tag2 = Tag.create!(title: "travel")     
# tag3 = Tag.create!(title: "java script")                       


