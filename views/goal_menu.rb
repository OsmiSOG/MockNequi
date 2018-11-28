class GoalMenu
    def start
        select_option
        end
        private 
    def show_menu
        puts "1.information about goals."
        puts "2.create a new goal."
        puts "3.close goal."
        puts "4.add money to a goal"
        puts "5.return menu"
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
                    puts 'information about goals.'
                when 2
                    puts 'create a new goal.'
                when 3
                    puts 'close goal.'
                when 4
                    puts 'add money to a goal'
                when 5
                    puts 'return'
                else
                    puts 'Wrong option'
                end
        end while option != 5
    end
    
end
