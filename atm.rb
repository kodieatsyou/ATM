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
		puts "Withdraw\nDeposit\nQuick Cash\nBalance\nLogout"
		screen_split
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
		elsif input == "balance"
			screen_split
			puts "Current balance: #{@curuser.balance}"
			welcome_screen(@curuser)
		else 
			welcome_screen(@curuser)
		end		
	end

	private
		def screen_split
			puts "~"*79
		end

		def deposit
			screen_split	
			puts "Please enter amount to deposit or enter END to quit"
			depositamt = gets.chomp.downcase
			if depositamt == "end"
				welcome_screen(@curuser)
			else
				depositamt = depositamt.to_i
				@curuser.balance += depositamt
				puts "Your current balance is: #{@curuser.balance}"
				save_file
				deposit
			end
		end

		def withdraw
			screen_split
			puts "Please enter amount to withdraw or enter END to quit"
			withdrawamt = gets.chomp.downcase
			if withdrawamt == "end"
				welcome_screen(@curuser)
			else
				withdrawamt = withdrawamt.to_i
				if (@curuser.balance - withdrawamt) >= 0
					@curuser.balance -= withdrawamt
					puts "Your current balance is: #{@curuser.balance}"
					save_file
					withdraw
				else
					puts "You do not have the necessary funds to complete this transaction"
					withdraw
				end
			end
		end

		def quickcash
			screen_split
			puts "Please choose an amount to take out or enter END to quit\n100\n50\n20\n10\n5"
			screen_split
			cash = gets.chomp.downcase
			if cash == "end"
				welcome_screen(@curuser)
			else
				cash = cash.to_i
				if cash == 100
					if cash - 100 >= 0
						@curuser.balance -= cash
						puts "Your current balance is: #{@curuser.balance}"
						quickcash
					else
						puts "You dont have the necessary funds"
						quickcash
					end
				elsif cash == 50
					if cash - 50 >= 0
						@curuser.balance -= cash
						puts "Your current balance is: #{@curuser.balance}"
						quickcash
					else
						puts "You dont have the necessary funds"
						quickcash
					end
				elsif cash == 20
					if cash - 20 >= 0
						@curuser.balance -= cash
						puts "Your current balance is: #{@curuser.balance}"
						quickcash
					else
						puts "You dont have the necessary funds"
						quickcash
					end
				elsif cash == 10
					if cash - 10 >= 0
						@curuser.balance -= cash
						puts "Your current balance is: #{@curuser.balance}"
						quickcash
					else
						puts "You dont have the necessary funds"
						quickcash
					end
				elsif cash == 5
					if cash - 5 >= 0
						@curuser.balance -= cash
						puts "Your current balance is: #{@curuser.balance}"
					  quickcash
					else
						puts "You dont have the necessary funds"
						quickcash
					end
				else
					puts "Please enter one of the amounts above"
					quickcash
				end
			end
		end

		def save_file
			f = File.open("Users.csv", "w")
			@users.each do |user|
				f.write("#{user.name}, #{user.pin}, #{user.balance} \n")
			end
			f.close
		end
end