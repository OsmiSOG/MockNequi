require_relative '../model/account'
require_relative '../options/account_controller'
require_relative '../model/db_conection'
class AccessAccount

  def initialize
    @account_cotroller = AccountController.new
  end

  def open_by_login(email)
    @user=User.new(email)
    @account_cotroller.initialize_account(@user)
    close_access
  end

  def open_by_register(name, email, password)
    create_account(name, email, password)
    @account_cotroller.initialize_account(@user)
    close_access
  end

  private
  def create_account(name, email, password)
    db = DBConection.new
    db.client.query("INSERT INTO `mock_nequi`.`users` (`name`, `email`, `password`)
      VALUES ('#{name}', '#{email}', '#{password}')")

    @user=User.new(email)

    db.client.query("INSERT INTO `mock_nequi`.`accounts` (`total_balance`, `user_id`, `created_at`, `updated_at`)
	   VALUES (0, #{@user.id}, '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}')")

    account_id = db.client.query("SELECT id FROM mock_nequi.accounts
      WHERE accounts.user_id = #{@user.id}")

    account_id.each do |id|
      db.client.query("INSERT INTO `mock_nequi`.`mattresses` (`balance`, `account_id`)
  	   VALUES (0, #{id['id']})")
    end
  end

  def close_access
    @user = nil
  end
end
