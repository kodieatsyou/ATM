# Automated Teller Machine

The purpose of this project was to create a ATM interface that the user can interact with in order to make transactions with his/her account.

  - Requires 4-digit PIN number
  - Users can make transactions such as, deposite, withdraw, quickcash

### Setup
To run this program you will need the following:
* [Ruby the language used for this project](https://www.ruby-lang.org/en/) 
* [Git used for running the program](https://git-scm.com/downloads) 

Assuming you have the programs above:

* Right click in the folder containing the file then select git bash - a console should appear

* Then run the following commands:

```sh
$ git clone https://github.com/kodieatsyou/ATM.git
```

```sh
$ ruby main.rb
```

The program should run you will be prompted with the welcome screen, you will need to enter a 4-digit PIN:
* User BOB : 1234
* User Samus : 2345
* User Link : 3456
* User Other Bob : 4567

### Questions
Im still confused on how reading and splitting files works:
```ruby
def create_users
	f = File.open(@file, "r")
	f.each_line do |data|
		data = data.split(',')
		@users.push(User.new(data[0], data[1].to_i, data[2].to_i))
	end
end
```

Im confused about communicationg between classes Example: Having classes change other another class's variables or using its methods.

How the ? at the end of a method name works example:
```ruby
def check_pin?(pin)
	return pin == @pin
end
```