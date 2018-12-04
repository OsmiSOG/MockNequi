require_relative '../model/db_conection'

class Transaction

  def initialize
    @db = DBConection.new
    @transaction_date
  end

  def deposit_money(params)
    @transaction_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @db.client.query("UPDATE `mock_nequi`.`accounts` SET `total_balance` = '#{params[:account_balance]+params[:money]}', `updated_at` = '#{transaction_date}' WHERE (`id` = '#{params[:account_id]}')")
    @db.client.query("INSERT INTO `mock_nequi`.`transactions` (`type`, `money`, `sender`, `email_addressee`, `account_id`, `description_movement_id`, `created_at`)
     VALUES (#{params[:type]}, #{params[:money]}, '#{params[:sender]}', '#{params[:receiver]}', #{params[:account_id]}, #{params[:description_movement_id]}, '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}')")
  end

  def withdrawals(params)
  end

  def send_money(params)
  end

  def receive_money(params)
  end

  def show_transactions(account_id, n)
  end


end
