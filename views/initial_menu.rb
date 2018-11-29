require_relative 'form_login'
require_relative 'form_register'
class InitialMenu

    def initialize
        puts '************** MOCK NEQUI ******************'
        puts ''
        puts '-- Welcome to Mock Nequi --'
        @login_form = FormLogin.new
        @registration_form = FormRegister.new
    end

    def start
        select_option
    end

    private
    def show_menu
        puts '1. Login account'
        puts '2. Create an account'
        puts '3. Close Mock Nequi'
    end

    def get_option
        print 'Enter to option: '
        option = gets.chomp.to_i
    end

    def select_option
        begin
            show_menu
            option = get_option
            case option
            when 1
                @login_form.request_informationdc
            when 2
                @registration_form.show_welcome_form
            when 3
                puts 'bye'
            else
                puts 'Wrong option'
            end
            end while option != 3
    end

end
