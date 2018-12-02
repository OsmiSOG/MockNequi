require_relative '../model/user'
require_relative '../model/pocket'
require_relative '../model/mattress'
require_relative '../model/goal'
require_relative '../model/transaction'
require_relative '../model/validators/account_validations'
require_relative '../model/db_conection'

class Account

  attr_accessor :mattress, :pocket, :goal, :transaction

  def initialize(user_id)
    @id
    @total_balance
    @available_balance
    @user_id = user_id
    @account_validations = AccountValidations.new
    @db_conection = DBConection.new
    acces_data_db
  end

  def acces_data_db
    #query para traer los datos de la cuenta
    calculate_available_balance
    set_data_base
  end

  def show_available_balance
    puts '1'
  end

  def show_total_balance
    puts '2'
  end
  
  def deposit_money
    puts '3'
  end

  def withdraw_money
    puts '4'
  end

  def send_money
    puts '5'
  end

  def check_transactions
    puts '6'
  end

  private
  def calculate_available_balance
  end

  def set_data_base
    @mattress = Mattress.new(@id)
    @pocket = Pocket.new(@id)
    @goal = Goal.new(@id)
    @transaction = Transaction(@id)
  end
end
