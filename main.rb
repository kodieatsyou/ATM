require_relative "usercreater"
require_relative "atm"
require_relative "user"
user_creater = Usercreater.new("Users.csv")
user_creater.create_users
users = user_creater.users
atm = Atm.new(users)
atm.start

