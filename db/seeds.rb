# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#puts 'SETTING UP DEFAULT USER LOGIN'
#user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.name
#user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user2.name
#user.add_role :admin

puts "SETTING UP DEFAULT ARTICLE"
article1 = Article.create! content: "content1", plan_id: "2", sub_category_id: "1", user_id: "1"
article2 = Article.create! content: "content2", plan_id: "2", sub_category_id: "1", user_id: "1"
article3 = Article.create! content: "content3", plan_id: "2", sub_category_id: "1", user_id: "1"