class PocketMenu
    def start
        select_option
        end
        private 
    def show_menu
        puts "1.information about pockets."
        puts "2.create a new pocket."
        puts "3.delete pocket."
        puts "4.add money to a pocket"
        puts "5.withdraw money from a pocket"
        puts "6.send money from one pocket to another"
        puts "7.return menu"
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
                else
                puts 'Wrong option'
                end
        end while option != 7
    end
    
end
