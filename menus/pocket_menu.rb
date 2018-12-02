class PocketMenu

  attr_accessor :option

    def start
      system 'cls'
    end

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
        @option = gets.chomp.to_i
    end



end
