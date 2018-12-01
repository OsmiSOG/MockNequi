require 'digest'
require_relative 'options/controller_form'

class FormLogin
  attr_accessor :email, :password

    def initialize
      @email
      @password
    end

    def request_information
      system 'cls'
      puts "-------------- Log in --------------\n"
      print 'enter email: '
      @email = gets.chomp
      print 'enter password: '
      @password = Digest::SHA2.hexdigest gets.chomp
    end

end
