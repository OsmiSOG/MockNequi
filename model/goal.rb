require 'date'
require_relative '../model/db_conection'
require_relative '../model/validators/goal_validations'

class Goal

  attr_accessor :name, :current_balance, :status, :active, :finish_time

  def initialize(account)
    @id
    @name
    @goal_balance
    @finish_at
    @current_balance
    @current_balance_total = sum_current_balance
    @account = account
    @db = DBConection.new
    @goal_validations = GoalValidations.new
  end

  def show_goals
    data=@db.client.query("SELECT * FROM mock_nequi.goals WHERE 'account_id' = #{@account.id}")
    data.each do |rows|
      @name = i['name']
      @goal_balance= i['goal_balance']#saldo meta
      @current_balance= i['current_balance'] #saldo actual
      @missing_money = calculate_missing_money
      @status = update_status
      @finish_time = i['finish_at']#fecha final
      @status= i['status'] #estado de la cuenta
      @active= i['active']
      print_goal
    end
  end

  def create_goal
    puts "\nNew goal"
    print "Name of the new goal: "
    name = gets.chomp
    print "What is the total amount of the goal: "
    goal_balance = gets.chomp
    print "Deadline for your goal 0000-00-00: "
    finish_at = gets.chomp
    if @goal_validations.parameters_correct?(name, goal_balance, finish_at, @account.id)
      goal_new=@db.client.query("INSERT INTO `mock_nequi`.`goals` (`name`, `current_balance`, `goal_balance`, `finish_at`, `created_at`, `account_id`, `active`)
        VALUES ('#{name}', '0', '#{goal_balance}', '#{finish_at}', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}', '#{@account.id}', '1')")
      puts "your goal has been created\n"
    else
      puts "Could not create goal, there are errors in the values ​​entered\n"
    end
  end

  def add_money
    puts "\nName of the goal you want to add money: "
    name = gets.chomp
    if @goal_validations.count_goals_same_name(@account.id, name) == 1 && @goal_validations.in_progress(@account_id, name)
      puts "\nEnter the amount of money you want to add to the goal: "
      amount = gets.chomp.to_i
      if amount <= @account.available_balance
        @db.client.query("UPDATE `mock_nequi`.`goals` SET `current_balance` = '#{current_balance_goal(name) + amount}' WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}')")
        @account.available_balance -= amount
        update_status(name)
      else
        puts "you do not have enough money available"
      end
    else
      puts "you can not add money to that goal\n"
    end
  end

  def close_goal
    puts "\nName of the pocket you want to delete: "
    name = gets.chomp
    if @goal_validations.count_goals_same_name(@account.id, name) == 1
      update_available_account(name, 'repay')
      @db.client.query("DELETE FROM `mock_nequi`.`pockets` WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}');")
      puts "Your goal has been correctly closed\n"
    else
      puts "Could not delete the pocket"
      puts "You do not have a pocket with that name\n"
    end
  end

  private
  def sum_current_balance
    @db.client.query("SELECT SUM(g.current_balance) FROM mock_nequi.goals AS g
      JOIN mock_nequi.accounts AS a
      ON g.account_id = #{@account.id}").each do |sum|
      @money = sum['SUM(g.current_balance)']
    end
    @money
  end

  def calculate_missing_money
    @goal_balance - @current_balance
  end

  def print_goal
    puts "- Name: #{@name}"
    puts "goal balance: #{@goal_balance}"
    puts "current money: #{@current_balance}"
    puts "missing money: #{@missing_money}"
    puts "goal status: #{@status}"
    puts "final date: #{@finish_at}"
  end


  def update_status(name)

    date = Date.parse(@expiration_date.to_s)
    @status = if date.ajd < Date.today.ajd
      missing_money <= 0 ? 'fulfilled' : 'expired'
    else
      missing_money <= 0 ? 'fulfilled' : 'in progress'
    end
    @db_conection.query("UPDATE 'goals' SET 'status' = '#{@status}'
      WHERE 'goals'.'id' = '#{@id}'")
    end

  def current_balance_goal(name)
    @db.client.query("SELECT g.current_balance FROM mock_nequi.goals AS g
      JOIN mock_nequi.accounts AS a
      ON g.account_id = #{@account.id}
      WHERE g.name = '#{name}'").each do |b|
      @money = b['balance']
    end
    @money
  end
end
