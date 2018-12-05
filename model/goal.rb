require 'db_conection'

class Goal

  attr_accessor :name, :current_balance, :status, :active, :finish_time

  def initialize(account_id)
    @id
    @name
    @goal_balance
    @current_balance
    @create_at
    @update_at
    @finish_at
    @account_id = account_id
  end

  def show_goals
    @id= id
    @db_conection= db_conection
    data=@db_conection.query("SELECT* FROM 'goals' WHERE 'id' = #{@id}")
    data.each do |i|
      @name
      @goal_balance= i['goal_balance']#saldo meta
      @current_balance= i['current_balance'] #saldo actual
      @create_time = i['create_time'] #fecha de inicio
      @finish_time = i['finish_time']#fecha final
      @status= i['status'] #estado de la cuenta
      @active= i['active']
      @account_id = i['account_id']# id de la cuenta
    end
  end

  def goals_created
    puts "new goals "
    goal_new=@db_conection.query("INSERT INTO 'goals' ('name', 'goal_balance','finish_at') VALUES (#{@name}, #{@goal_balance}, #{@finish_time}) WHEN account_id= '#{account_id}')")
  end


  def update_status
    date = Date.parse(@expiration_date.to_s)
    @status = if date.ajd < Date.today.ajd
            missing_money <= 0 ? 'fulfilled' : 'expired'
          else
            missing_money <= 0 ? 'fulfilled' : 'in progress'
          end
    @db_conection.query("UPDATE 'goals' SET 'status' = '#{@status}'
                      WHERE 'goals'.'id' = '#{@id}'")
  end

  def add_money
    account_id= return_information(db_conection.query("SELECT id FROM accounts WHERE user_id = '#{@user_id}'"), @name)
  end

  def deposit_money()
    #account_id= return_information(db_conection.query("SELECT id FROM accounts WHERE user_id = '#{@user_id}'"), id
    #@db_conection.query("UPDATE 'account' SET 'available' = available - '#{amount}' WHERE id = '#{account_id}'")
    #@db_conection.query("UPDATE 'goals' SET 'current_balance' = '#{@current_balance + amount}' WHERE 'goals'.'id' = '#{@id}'")
    #@db_conection.query("INSERT INTO 'transactions' ( 'user_id', 'amount') VALUES (#{@user_id},#{amount})")
    puts "\nhow much money will you deposit: "
    amount = gets.chomp.to_i
    if new_money > 0
      info_transaction = {
        money: new_money,
        account_id: @id,
        description_movement_id: 1,
        account_balance: @total_balance
      }
      @transaction.deposit_money
      @goal_balance += new_money
      @current_balance += new_money
      puts 'completed transaction'
    else
      puts 'Enter values ​​greater than 0'
    end
  end

  def current_balance_total

  end


  def return_information(information, name)
    information.each do|i|
      return i[name]
    end
  end

  def close_goal()
    @account
    puts "You have selected to close a goal"
    puts "which goal you want to close"
    @db_conection.query("UPDATE 'goals' SET 'active'='0' WHERE 'goals'.'id'= '#{@id}'")
    @active='0'
    puts "correctly closed"
  end

  def list_goals
    puts "name of the goal: #{@name}"
    puts "start date: #{@create_time}"
    puts "final goal balance: #{@goal_balance}"
    puts "current money: #{@current_balance}"
    puts "missing money: #{missing_money}"
    puts "goal status: #{@status}"
    puts "final date: #{@finish_time}"

  end

  def missing_money
    @goal_balance - @current_balance
  end
end
