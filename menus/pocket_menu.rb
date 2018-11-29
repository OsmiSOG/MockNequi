class PocketMenu

    def start
      system 'cls'
      select_option
    end

    private
    def show_menu
      puts "-------------- Pocket Menu --------------\n"
        puts "1. Information about pockets."
        puts "2. Create a new pocket."
        puts "3. Delete pocket."
        puts "4. Add money to a pocket"
        puts "5. Withdraw money from a pocket"
        puts "6. Send money from one pocket to another"
        puts "7. Return menu"
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
                puts 'information about pockets.'
            when 2
                puts 'create a new pocket.'
            when 3
                puts 'delete pocket.'
            when 4
                puts 'add money to a pocket.'
            when 5
                puts 'withdraw money from a pocket'
            when 6
                puts 'send money from one pocket to another'
            when 7
                puts 'return'
                system 'cls'
            else
                puts 'Wrong option'
            end
        end while option != 7
    end

end
