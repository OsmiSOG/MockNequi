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
    @user = user
    @account = Account.new(@user.id)
    @account_menu.start
    @select_option_accout
  end

  def select_option_accout
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
          puts 'Sign off'
          system 'cls'
      else
          puts 'Wrong option'
      end
    end while option != 10
  end

  def select_option_goal
      begin
          @goal_menu.show_menu
          @goal_menu.get_option
              case @goal_menu.option
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
                  system 'cls'
              else
                  puts 'Wrong option'
              end
      end while option != 5
  end

  def select_option_mattress
      begin
        @mattress_menu.show_menu
        @mattress_menu.get_option
        case @mattress_menu.option
        when 1
            puts 'check'
            puts 'money in the mattress'
        when 2
            puts 'add money mattress'
        when 3
            puts 'withdram money'
        when 4
            puts 'return'
            system 'cls'
        else
            puts 'Wrong option'
        end
      end while option != 4
  end

  def select_option_pocket
      begin
          @pocket_menu.show_menu
          @pocket_menu.get_option
          case @pocket_menu.option
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
