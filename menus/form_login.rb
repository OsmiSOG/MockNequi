require 'digest'
require_relative 'options/controller_form'

class FormLogin

    def initialize
      @controller_form = ControllerForm.new
    end

    def request_information
      system 'cls'
      puts "-------------- Log in --------------\n"
      print 'enter email: '
      email = gets.chomp
      print 'enter password: '
      password = Digest::SHA2.hexdigest gets.chomp
      @controller_form.form_login(email,password)
    end

end
