require_relative '../model/user'
require_relative '../model/account'
require_relative '../menus/account_menu'
require_relative '../menus/mattress_menu'
require_relative '../menus/pocket_menu'
require_relative '../menus/goal_menu'

class AccountController

  def initialize
    @user
    @account
    @account_menu = AccountMenu.new
    @mattress_menu = MattressMenu.new
    @pocket_menu = PocketMenu.new
    @goal_menu = GoalMenu.new
  end

  def initialize_account(user)
    puts 'initialize_account'
    @user = user
    @account = Account.new(@user.id)
    @account_menu.start
    select_option_account
  end

  def select_option_account
    begin
      @account_menu.show_menu
      @account_menu.get_option
      case @account_menu.option
      when 1
        @account.show_available_balance
      when 2
        @account.show_total_balance
      when 3
        @account.deposit_money
      when 4
        @account.withdraw_money
      when 5
        @account.send_money
      when 6
        @account.check_transactions
      when 7
        @mattress_menu.start
        select_option_mattress
      when 8
        @pocket_menu.start
        select_option_pocket
      when 9
        @goal_menu.start
        select_option_goal
      when 10
          close_account
          puts 'Sign off'
          system 'cls'
      else
          puts 'Wrong option'
      end
    end while @account_menu.option != 10
  end

  def select_option_mattress
    begin
      @mattress_menu.show_menu
      @mattress_menu.get_option
      case @mattress_menu.option
      when 1
        @account.mattress.show_balance
      when 2
        @account.mattress.add_money
      when 3
        @account.mattress.remove_money
      when 4
        puts 'return'
        system 'cls'
      else
        puts 'Wrong option'
      end
    end while @mattress_menu.option != 4
  end

  def select_option_pocket
    begin
      @pocket_menu.show_menu
      @pocket_menu.get_option
      case @pocket_menu.option
      when 1
        @account.pocket.show_pockets
      when 2
        @account.pocket.create_pocket
      when 3
        @account.pocket.eliminate_pocket
      when 4
        @account.pocket.add_money
      when 5
        @account.pocket.remove_money
      when 6
        @account.pocket.send_money
      when 7
        puts 'return'
        system 'cls'
      else
        puts 'Wrong option'
      end
    end while @pocket_menu.option != 7
  end

  def select_option_goal
      begin
          @goal_menu.show_menu
          @goal_menu.get_option
              case @goal_menu.option
              when 1
                  @account.goal.show_goals
              when 2
                  @account.goal.create_goal
              when 3
                  @account.goal.add_money
              when 4
                  @account.goal.close_goal
              when 5
                  puts 'return'
                  system 'cls'
              else
                  puts 'Wrong option'
              end
      end while @goal_menu.option != 5
  end

  private
  def close_account
    @user = nil
    @account = nil
  end

end
