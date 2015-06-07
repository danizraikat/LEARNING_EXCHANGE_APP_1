class AddUsernameAndFirstNameAndLastNameAndBioAndGaCourseAndLocationAndWebsite1AndWebsite2AndWebsite3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :ga_course, :string
    add_column :users, :location, :string
    add_column :users, :website_1, :text
    add_column :users, :website_2, :text
    add_column :users, :website_3, :text
  end
end
