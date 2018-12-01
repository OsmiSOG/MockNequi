require_relative 'options/form_controller'

class InitialMenu

    def initialize
        puts "************** MOCK NEQUI ******************\n"
        @form_controller = FormController.new
    end

    def start
        select_option
    end

    private
    def show_menu
      puts "-- Welcome to Mock Nequi --\n"
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
                @form_controller.start_login
            when 2
                @form_controller.start_register
            when 3
                puts 'bye'
            else
                puts 'Wrong option'
            end
            end while option != 3
    end

end
