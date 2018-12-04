
require 'db_conection'
class Goal

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
    @db_conection= DBConection.new
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

  def create_goal
    puts '2'
  end

  def add_money
    account_id= return_information(db_conection.query("SELECT id FROM accounts WHERE user_id = '#{@user_id}'"), @name)
  end

  def close_goal
    puts '4'
  end

  def current_balance_total

  end

  private
  def return_information(information, name)
    information.each do|i|
      return i[name]
    end
  end

  def missing_money
    @goal_balance - @current_balance
  end


end
