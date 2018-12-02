require_relative '../model/account'
require_relative '../options/account_controller'
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
    #Query para insertar el usuario
    #Query para insertar la cuenta
    #Query para insertar el colchon
  end

end
