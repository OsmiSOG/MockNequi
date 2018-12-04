require 'db_conection'
class Mattress

  def initialize(account_id)
    @balance
    @account_id
    @account_id = account_id
    acces_data_db
    @db_conection
    @current_balance
    @user_id

  end

  def show_balance
    puts '1'
  end

  def add_money
    puts "enter the amount of money you want to add to the mattress"
    amount = gets.chomp.to_i
    account_id = return_element(@db_conection.quiery("SELECT id FROM account WHERE user_id= '#{@user_id}''")), 'id'
    @db_conection.query("UPDATE 'matress' SET 'current_balance' = '#{@current_balance + amount}' WHERE 'matress'.'id' = '#{@id}'")
    @db_conection.query("INSERT INTO 'transactions' ( 'user_id', 'amount') VALUES (#{@user_id},#{amount})")
    @db_conection.quiery('BEGIN')
    @balance= new_money

  end

  def remove_money(amount)
    puts "Enter the amount of money you want to remove"
    new_money=gets.chomp.to_i
    account_id=  return_element(@db_conection.query("SELECT id FROM accounts WHERE user_id = '#{@user_id}'"), 'id')
    @db_conection.query('BEGIN')

  end

  private
  def acces_data_db

  end
  def return_element(element, name)
    element.each do |i|
      return i[name]
    end
  end
end
