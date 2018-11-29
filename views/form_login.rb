require 'digest'

class FormLogin

    def initialize
      @email
      @password
    end

    def request_information
      puts '-------------- Log in --------------'
      print 'enter email: '
      @email = gets.chomp
      print 'enter password: '
      @password = Digest::SHA2.hexdigest gets.chomp
    end

end
