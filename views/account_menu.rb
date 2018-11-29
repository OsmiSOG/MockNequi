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
      select_option
  end

  private
  def show_menu
      puts "MOCK NEQUI"
      puts "Account "
      puts "1.check available balance."
      puts "2.check total balance available."
      puts "3.enter money into the account."
      puts "4.withdraw money from the account."
      puts "5.send money."
      puts "6.check transactions."
      puts "7.mattress."
      puts "8.pocket."
      puts "9.goals."
      puts "10.Sign off."
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
          puts 'mattress.'
      when 8
          puts 'pocket.'
      when 9
          puts 'goals.'
      when 10
          puts 'Sign off.'
      else
          puts 'Wrong option'
      end
    end while option != 10
  end

end
