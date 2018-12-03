require_relative '../model/account'
require_relative '../options/account_controller'
require_relative '../model/db_conection'
class AccessAccount

  def initialize
    @account_cotroller = AccountController.new
  end

  def open_by_login(email)
    user=User.new(email)
    @account_cotroller.initialize_account(user)
    user = nil
  end

  def open_by_register(name, email, password)
    create_account(name, email, password)
    user=User.new(email)
    @account_cotroller.initialize_account(user)
    user = nil
  end

  private
  def create_account(name, email, password)
    t = Time.now
    db = DBConection.new
    db.client.query("INSERT INTO `mock_nequi`.`users` (`name`, `email`, `password`)
      VALUES ('#{name}', '#{email}', '#{password}')")
    db
    id=@db.client.query("select id from mock_nequi.users
      where email = #{@email}")
    #Query para insertar el usuario
    #Query para insertar la cuenta
    #Query para insertar el colchon
  end

end
