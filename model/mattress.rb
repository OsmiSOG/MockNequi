class Mattress

  attr_accessor :balance

  def initialize(account_id)
    @balance
    @account_id = account_id
    acces_data_db
  end

  def show_balance
    puts '1'
  end

  def add_money
    puts '2'
  end

  def remove_money
    puts '3'
  end

  private
  def acces_data_db

  end
end
