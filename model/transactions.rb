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
     VALUES (#{params[:type]}, #{params[:money]}, '#{params[:sender]}', '#{params[:receiver]}', #{params[:account_id]}, #{params[:description_movement_id]}, '#{@transaction_date}')")
  end

  def withdrawals(params)
    @transaction_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @db.client.query("UPDATE `mock_nequi`.`accounts` SET `total_balance` = '#{params[:account_balance]-params[:money]}', `updated_at` = '#{@transaction_date}' WHERE (`id` = '#{params[:account_id]}')")
    @db.client.query("INSERT INTO `mock_nequi`.`transactions` (`type`, `origin_pocket`,`money`, `email_addressee`, `account_id`, `description_movement_id`, `created_at`)
     VALUES (#{params[:type]}, '#{params[:origin_pocket]}', #{params[:money]}, '#{params[:receiver]}', #{params[:account_id]}, #{params[:description_movement_id]}, '#{@transaction_date}')")
  end

  def send_money(params)
    @transaction_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @db.client.query("UPDATE `mock_nequi`.`accounts` SET `total_balance` = '#{params[:account_balance]-params[:money]}', `updated_at` = '#{@transaction_date}' WHERE (`id` = '#{params[:account_id]}')")
    receive_money(params)
    @db.client.query("INSERT INTO `mock_nequi`.`transactions` (`type`, `origin_pocket`,`money`,`sender`,`email_addressee`, `account_id`, `description_movement_id`, `created_at`)
     VALUES (#{params[:type]}, '#{params[:origin_pocket]}', #{params[:money]}, '#{params[:sender]}' ,'#{params[:receiver]}', #{params[:account_id]}, #{params[:description_movement_id]}, '#{@transaction_date}')")
  end

  def show_transactions(account_id, n)
    transactions = @db.client.query("SELECT t.type, t.origin_pocket, t.money, t.sender, t.email_addressee, dm.name, t.created_at FROM mock_nequi.transactions AS t
      JOIN mock_nequi.accounts AS a
      ON t.account_id = a.id
      JOIN mock_nequi.description_movements AS dm
      ON t.description_movement_id = dm.id
      WHERE t.account_id = #{account_id}
      ORDER BY t.created_at DESC
      LIMIT #{n}")
      print_transactions(transactions)
  end

  private
  def receive_money(params)
    user = User.new(params[:email])
    @db.client.query("UPDATE `mock_nequi`.`accounts` SET `total_balance` = '#{params[:account_balance]+params[:money]}', `updated_at` = '#{@transaction_date}' WHERE (`user_id` = '#{user.id}')")
    @db.client.query("INSERT INTO `mock_nequi`.`transactions` (`type`, `money`, `sender`, `email_addressee`, `account_id`, `description_movement_id`, `created_at`)
     VALUES (1, #{params[:money]}, '#{params[:sender]}', '#{params[:receiver]}', #{account_receive(user)}, 3, '#{@transaction_date}')")
  end

  def account_receive(user)
    id = 0
    @db_conection.client.query("SELECT id FROM mock_nequi.accounts
      WHERE user_id = #{user.id}").each do |row|
      id = row['id']
    end
    return id
  end

  def print_transactions(transactions)
    i = 0
    transactions.each do |row|
      i = i+1
      puts "#{i}. #{row}"
    end
  end
end
