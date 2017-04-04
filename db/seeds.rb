# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.delete_all
Genre.create(:id => 1, :name => 'エンタメ・趣味')
Genre.create(:id => 2, :name => 'スポーツ')
Genre.create(:id => 3, :name => '恋愛・結婚')
Genre.create(:id => 4, :name => 'ニュース')
Genre.create(:id => 5, :name => 'その他')

User.delete_all
img = File.open("public/img/init_img.png", "r+b")
User.create(:id => 1, :email => 'afa3c2rgsg@i.softbank.jp', :name => 'ティモチー', :password => 'Hawksfan815', :password_confirmation => 'Hawksfan815', :img => img.read, :img_content => "image/png", :user_available => true)
User.create(:id => 2, :email => 'ucckc061506@yahoo.co.jp', :name => 't-tsukamoto', :password => 'taka0615', :password_confirmation => 'taka0615', :img => img.read, :img_content => "image/png", :user_available => true)