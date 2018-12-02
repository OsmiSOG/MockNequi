require_relative 'model/account'
require_relative 'menus/account_menu'
class AccessAccount

  def initialize
    @user
  end

  def open_by_login(email)
    @user.User.new(email)
    @account_cotroller.initialize_account(@user)
  end

  def open_by_register(name, email, password)
    create_account(name, email, password)
    @user.User.new(email)
    @account_cotroller.initialize_account(@user)
  end

  private
  def create_account(name, email, password)
    #Query para insertar el usuario
    #Query para insertar la cuenta
    #Query para insertar el colchon
  end

end
