class Pocket

  def initialize(account_id)
     @account_id = account_id
     @total_balance = total_balance_db
  end

  def show_pockets
    puts '1'
  end

  def create_pocket
    puts '2'
  end

  def eliminate_pocket
    puts '3'
  end

  def add_money
    puts '4'
  end

  def remove_money
    puts '5'
  end

  def send_money
    puts '6'
  end

  private
  def total_balance_db

  end

end
