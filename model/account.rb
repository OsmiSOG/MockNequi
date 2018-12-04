require_relative '../model/user'
require_relative '../model/pocket'
require_relative '../model/mattress'
require_relative '../model/goal'
require_relative '../model/transaction'
require_relative '../model/validators/account_validations'
require_relative '../model/db_conection'

class Account

  attr_accessor :mattress, :pocket, :goal, :transaction

  def initialize(user)
    @id
    @total_balance
    @available_balance
    @user = user
    @transaction
    @account_validations = AccountValidations.new
    @db_conection = DBConection.new
    get_data_db
  end

  def get_data_db
    @db_conection.client.query("SELECT id, total_balance FROM mock_nequi.accounts
      WHERE user_id = #{@user.id}").each do |row|
      @id = row['id']
      @total_balance = row['total_balance']
    end
    set_data_base
    @available_balance = calculate_available_balance
  end

  def show_available_balance
    puts "\nYour available balance: #{@available_balance}\n"
  end

  def show_total_balance
    puts "\nyour total balance: #{@total_balance}\n"
  end

  def deposit_money
    puts "\nhow much money will you deposit: "
    new_money = gets.chomp.to_i
    if new_money > 0
      info_transaction = {
        type: 1,
        money: new_money,
        sender: @user.name,
        receiver: @user.email,
        account_id: @id,
        description_movement_id: 1,
        account_balance: @total_balance
      }
      @transaction.deposit_money(info_transaction)
      @total_balance += new_money
      @available_balance += new_money
      puts "completed transaction\n"
    else
      puts "Enter values ​​greater than 0\n"
    end
  end

  def withdraw_money
    puts "\nhow much money will you withdraw: "
    out_money = gets.chomp.to_i
    if out_money <= @available_balance
      info_transaction = {
        type: 2,
        origin_pocket: 'Available',
        money: out_money,
        receiver: @user.email,
        account_id: @id,
        description_movement_id: 2,
        account_balance: @total_balance
      }
      @transaction.withdrawals(info_transaction)
      @total_balance -= out_money
      @available_balance -= out_money
      puts "#{out_money} retired money"
    else
      puts 'you do not have enough balance to withdraw'
    end
  end

  def send_money
    puts "\nhow much money will you send "
    send_money = gets.chomp.to_i
    puts "which is mail from the other user's account"
    receiver_email = gets.chomp.to_i
    if send_money <= @available_balance && @account_validations.email_correct?(receiver_email)
      info_transaction = {
        type: 2,
        origin_pocket: 'Available',
        money: send_money,
        sender: @user.name,
        receiver: receiver_email,
        account_id: @id,
        description_movement_id: 4,
        account_balance: @total_balance
      }
      @transaction.withdrawals(info_transaction)
      @total_balance -= send_money
      @available_balance -= send_money
      puts "#{out_money} send money to #{receiver_email}\n"
    else
      puts "You do not have enough balance to send\n"
    end
  end

  def check_transactions
    puts 'There has been a problem with the email entered'
    n = gets.chomp.to_i
    @transaction.show_transactions(@id, n)
  end

  private
  def set_data_base
    @mattress = Mattress.new(self)
    @pocket = Pocket.new(self)
    @goal = Goal.new(self)
    @transaction = Transaction.new
  end

  def calculate_available_balance
    @available_balance = @total_balance-@mattress.balance-@pocket.total_balance-@goal.current_balance_total
  end
end
