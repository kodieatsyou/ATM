class User
	attr_accessor :name, :pin, :balance
	def initialize(name, pin, balance)
		@name = name
		@pin = pin
		@balance = balance
	end

	def info
		puts @name
		puts @pin
		puts @balance
	end

	def check_pin?(pin)
		return pin == @pin
	end
end