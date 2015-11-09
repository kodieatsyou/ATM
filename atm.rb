require_relative "user"
require_relative "usercreater"
class Atm
	def initialize(users)
		@users = users
		@curuser = nil
	end

	def start
		screen_split
		puts "Welcome! (^-^) \nPlease Input Your 4-Digit PIN"
		pin = $stdin.gets.chomp
		userFound = false
		@users.each do |user|
			if user.check_pin?(pin.to_i)
				@curuser = user
				userFound = true
			end
		end
		if userFound
			screen_split
			puts "Welcome #{@curuser.name}"
			welcome_screen(@curuser)
		else
			puts "NO USER FOUND"
			start
		end
	end

	def welcome_screen(user)
		screen_split
		puts "User: #{user.name}"
		puts "Balance: #{user.balance}"
		puts "What would you like to do #{user.name}?"
		puts "Withdraw\nDeposit\nQuick Cash\nLogout"
		input = $stdin.gets.chomp.downcase
		if input == "logout"
			@curuser = nil
			start
		elsif input == "deposit"
			deposit
		elsif input == "withdraw"
			withdraw
		elsif input == "quick cash"
			quickcash
		else welcome_screen
		end			
	end

	private
		def screen_split
			puts "~"*79
		end
end