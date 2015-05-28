require_relative '../models/user'

user = User.new({ :user_name => "cookie", :email => "cookie@monster.com", :password => "cookie" })
user.encrypt_password
user.save


