require 'user'
require 'pocket'
require 'mattress'
require 'goal'

class Account

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
  end

  def show_available_balance
  end

  def show_total_balance
  end

  def deposit_money
  end

  def withdraw_money
  end

  def send_money
  end

  def check_transactions
  end

  private
  def calculate_available_balance
  end

  def set_data_base
    @mattress = Mattres.new(@id)
    @pocket = Pocket.new(@id)
    @goal = Goal.new(@id)
    @transaction = Transaction(@id)
  end
end
