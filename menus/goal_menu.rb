class GoalMenu

    attr_accesor :option

    def start
      system 'cls'
    end

    private
    def show_menu
      puts "-------------- Goal Menu --------------\n"
        puts "1. Information about goals."
        puts "2. Create a new goal."
        puts "3. Close goal."
        puts "4. Add money to a goal"
        puts "5. Return menu"
    end

    def get_option
        print 'Enter to option: '
        @option = gets.chomp.to_i
    end




end
