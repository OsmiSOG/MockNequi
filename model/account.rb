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

  end

  def get_data_db

    calculate_available_balance
  end

  def show_available_balance
  end

  def show_total_balance
  end
  
  private
  def calculate_available_balance
  end
end
