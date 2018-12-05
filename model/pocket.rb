require_relative '../model/db_conection'
require_relative '../model/validators/pocket_validations'
require_relative '../model/validators/account_validations'
require_relative '../model/transactions'
class Pocket

  def initialize(account)
     @db = DBConection.new
     @pocket_validations = PocketValidations.new
     @account_validations = AccountValidations.new
     @transaction = Transaction.new
     @account = account
     @total_balance = total_balance_db
  end

  def show_pockets
    if @pocket_validations.count_pockets(@account.id) > 0
      puts "\nList of pockets"
      pockets=@db.client.query("SELECT p.name, p.balance, FROM mock_nequi.pockets AS p
        JOIN mock_nequi.accounts AS a
        ON p.account_id = #{@account.id}")
      i=0
      pocket_exits.each do|row|
          i = i+1
          puts "#{i}. #{row}"
      end
    else
      puts "You have no pockets"
    end
  end

  def create_pocket
    puts "\nNew pocket"
    puts "What is the name of your new pocket?: "
    name = gets.chomp
    if @pocket_validations.count_pockets_same_name(@account.id, name) <= 0
      @db.query("INSERT INTO `mock_nequi`.`pockets` (`id`, `name`, `balance`, `created_at`, `account_id`) VALUES ('', '#{name}', 0, '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}', '#{@account.id}')")
      puts "Your pocket has been created\n"
    else
      puts 'Could not create pocket'
      puts "You already have a pocket with that name\n"
    end
  end

  def eliminate_pocket
    puts "\nName of the pocket you want to delete: "
    name = gets.chomp
    if @pocket_validations.count_pockets_same_name(@account.id, name) == 1
      update_available_account(name, 'repay')
      @db.client.query("DELETE FROM `mock_nequi`.`pockets` WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}');")
      puts "Your pocket has been deleted\n"
    else
      puts "Could not delete the pocket"
      puts "You do not have a pocket with that name\n"
    end

  end

  def add_money
    puts "\nName of the pocket you want to add money: "
    name = gets.chomp
    if @pocket_validations.count_pockets_same_name(@account.id, name) == 1
      puts "\nEnter the amount of money you want to add to the pocket: "
      amount = gets.chomp.to_i
      if amount <= @account.available_balance
        @db.client.query("UPDATE `mock_nequi`.`pockets` SET `balance` = '#{balance_pocket(name) + amount}' WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}')")
        @account.available_balance -= amount
      else
        puts "you do not have enough money available"
      end
    else
      puts "You do not have a pocket with that name\n"
    end
  end

  def remove_money
    puts "\nName of the pocket you want to remove money: "
    name = gets.chomp
    if @pocket_validations.count_pockets_same_name(@account.id, name) == 1
      puts "\nEnter the amount of money you want to add to the pocket: "
      amount = gets.chomp.to_i
      if amount <= balance_pocket(name)
        @db.client.query("UPDATE `mock_nequi`.`pockets` SET `balance` = '#{balance_pocket(name) - amount}' WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}')")
        @account.available_balance += amount
      else
        puts "you do not have enough money available\n"
      end
    else
      puts "You do not have a pocket with that name\n"
    end
  end

  def send_money
    puts "\nName of the pocket you want to send money: "
    name = gets.chomp
    if @pocket_validations.count_pockets_same_name(@account.id, name) == 1
      puts "\nhow much money will you send "
      send_money = gets.chomp.to_i
      puts "which is mail from the other user's account"
      receiver_email = gets.chomp.to_i
      if send_money <= balance_pocket(name) && @account_validations.email_correct?(receiver_email)
        info_transaction = {
          type: 2,
          origin_pocket: name,
          money: send_money,
          sender: @user.name,
          receiver: receiver_email,
          account_id: @account.id,
          description_movement_id: 4,
          account_balance: @account.total_balance
        }
        @transaction.send_money(info_transaction)
        @db.client.query("UPDATE `mock_nequi`.`pockets` SET `balance` = '#{balance_pocket(name) - send_money}' WHERE (`account_id` = '#{@account.id}' AND `name` = '#{name}')")
        @account.total_balance -= send_money
        @account.available_balance -= send_money
        puts "#{send_money} send money to #{receiver_email}\n"
      else
        puts "You do not have enough balance to send\n"
      end
    else
      puts "You do not have a pocket with that name\n"
    end
  end

  private
  def total_balance_db
    @db.client.query("SELECT SUM(p.balance) FROM mock_nequi.pockets AS p
      JOIN mock_nequi.accounts AS a
      ON p.account_id = #{@account.id}").each do |sum|
      @money = sum['SUM(p.balance)']
    end
    @money
  end

  def update_available_account(name, operation)
    q_balance = @db.client.query("SELECT p.balance FROM mock_nequi.pockets AS p
      JOIN mock_nequi.accounts AS a
      ON p.account_id = #{@account.id}
      WHERE p.name = '#{name}'")
      case operation
      when 'repay'
        q_balance.each do |b|
          @account.available_balance += b['balance'].to_i
        end
      when 'remove'
        q_balance.each do |b|
          @account.available_balance -= b['balance'].to_i
        end
      end
  end

  def balance_pocket(name)
    @db.client.query("SELECT p.balance FROM mock_nequi.pockets AS p
      JOIN mock_nequi.accounts AS a
      ON p.account_id = #{@account.id}
      WHERE p.name = '#{name}'").each do |b|
      @money = b['balance']
    end
    @money
  end
end
