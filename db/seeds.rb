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

#puts 'SETTING UP DEFAULT article'
#article = Article.create! :content =>'test1', :plan_id =>'1',:sub_category_id=>'1',:user_id=>'1'
#puts 'New article created: ' << article.content
#article2 = Article.create! :content =>'test2', :plan_id =>'2',:sub_category_id=>'2',:user_id=>'2'
#puts 'New article created: ' << article2.content

puts 'SETTING UP DEFAULT comment'
comment = Comment.create! :content =>'test1', :article_id=>'1',:user_id=>'1'
puts 'New comment created: ' << comment.content
comment2 = Comment.create! :content =>'test2', :article_id=>'2',:user_id=>'2'
puts 'New comment created: ' << comment2.content

