require 'digest'

class FormRegister

    attr_accessor :name, :email, :password

  def initialize
      @name
      @email
      @password
  end

  def request_information
    system 'cls'
      puts "-------------- Create an account --------------\n"
      puts 'Welcome to user registration'
      puts 'To register fill in the following fields'
      request_data
  end

  private
  def request_data
      print 'enter your name:'
      @name=gets.chomp
      print 'enter your email:'
      @email=gets.chomp
      print 'enter a password:'
      @password=Digest::SHA2.hexdigest gets.chomp

  end

  def dark_password
  end

end
