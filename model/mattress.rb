require 'db_conection'
class Mattress

  attr_accessor :balance

  def initialize(account)
    @id
    @balance
    @account = account
    @db = DBConection.new
    acces_data_db
  end

  def show_balance
    puts "\nYour mattress goes like this: "
    puts "Balance: $#{balance}\n"
  end

  def add_money
    if @account.available_balance > 0
      puts "\nEnter the amount of money you want to add to the mattress: "
      amount = gets.chomp.to_i
      if ammount < @account.available_balance
        @db_conection.query("UPDATE `mock_nequi`.`mattresses` SET `balance` = '#{@balance + ammount}' WHERE (`id` = '#{@id}')")
        @balance += ammount
        @account.available_balance -= ammount
      else
        puts "There is not enough balance in available"
        puts "The most you can move is #{@account.available_balance}\n"
      end
    else
      puts "There is no money available in the account\n"
    end
  end

  def remove_money(amount)
    if @balance > 0
      puts "\nEnter the amount of money you want to remove: "
      ammount = gets.chomp.to_i
      if ammount <= @balance
        @db_conection.query("UPDATE `mock_nequi`.`mattresses` SET `balance` = '#{@balance - ammount}' WHERE (`id` = '#{@id}')")
        @balance -= ammount
        @account.available_balance += ammount
      else
        puts "You can not move more than what is on your mattress\n"
      end
    else
      puts "There is no money to remove\n"
    end
  end

  private
  def acces_data_db
    @db.client.query("SELECT id, balance FROM mock_nequi.mattresses
      WHERE account_id = #{@account.id}").each do |row|
      @id = row['id']
      @balance = row['balance']
    end
  end

end
