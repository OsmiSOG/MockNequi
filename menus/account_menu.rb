require_relative 'pocket_menu'
require_relative 'mattress_menu'
require_relative 'goal_menu'

class AccountMenu

  def initialize
    @pocket_menu = PocketMenu.new
    @mattress_menu = MattressMenu.new
    @goal_menu = GoalMenu.new
  end

  def start
    system 'cls'
    select_option
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
      option = gets.chomp.to_i
  end

  def select_option
    begin
      show_menu
      option = get_option
      case option
      when 1
          puts 'check available balance.'
      when 2
          puts 'check total balance available.'
      when 3
          puts 'enter money into the account.'
      when 4
          puts 'withdraw money from the account.'
      when 5
          puts 'send money.'
      when 6
          puts 'check transactions.'
      when 7
        @mattress_menu.start
      when 8
        @pocket_menu.start
      when 9
        @goal_menu.start
      when 10
          puts 'Sign off'
          system 'cls'
      else
          puts 'Wrong option'
      end
    end while option != 10
  end

end
