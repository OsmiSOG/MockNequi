require_relative 'pocket_menu'
require_relative 'mattress_menu'
require_relative 'goal_menu'

class AccountMenu

  attr_accesor :option

  def initialize
    @option
  end

  def start
    system 'cls'
  end

  private
  def show_menu
    puts "-------------- Account Menu --------------\n"
      puts "1. Check available balance."
      puts "2. Check total balance available."
      puts "3. Enter money into the account."
      puts "4. Withdraw money from the account."
      puts "5. Send money."
      puts "6. Check transactions."
      puts "7. Mattress."
      puts "8. Pocket."
      puts "9. Goals."
      puts "10. Sign off."
    end

  def get_option
      print 'Enter to option: '
      @option = gets.chomp.to_i
  end



end
