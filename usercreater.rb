require_relative "user" 
class Usercreater

	attr_accessor :users
	def initialize(file)
		@file = file
		@data = []
		@users= []
	end

	def create_users
		f = File.open(@file, "r")
		f.each_line do |data|
			data = data.split(',')
			@users.push(User.new(data[0], data[1].to_i, data[2].to_i))
		end
	end

end