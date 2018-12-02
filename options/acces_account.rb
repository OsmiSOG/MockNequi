require_relative 'model/account'
require_relative 'menus/account_menu'
class AccessAccount

  def initialize
    @user = User.new
  end

  def open_by_login(email)
    @user.set_user(email)
    @account_cotroller.initialize_account(@user)
  end

  def open_by_register(name, email, password)
    create_user
    @user.asign_account
    @account_cotroller.initialize_account(@user)
  end

  private
  def create_user
    #Query para insertar el usuario
  end

end
