require 'digest'


class FormRegister

  def initialize
      @name
      @email
      @password
  end

  def show_welcome_form
      puts '-------------- Create an account --------------'
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

end
