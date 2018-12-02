class MattressMenu

  attr_accesor :option

    def start
      system 'cls'
    end

    private
    def show_menu
      puts "-------------- Mattress Menu --------------\n"
        puts "1. Check the money saved in the mattress."
        puts "2. Add available money to the mattress."
        puts "3. Withdraw money from the mattress, which will be available again in the account."
        puts "4. Return menu"
    end

    def get_option
        print 'Enter to option: '
        @option = gets.chomp.to_i
    end




end
