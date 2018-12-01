require_relative 'model/account'
require_relative 'menus/account_menu'
class AccessAccount

  def initialize
    @user = User.new
    @account_menu = AccountMenu.new
  end

  def open_by_login(email)
    @user.getData(email)
    @account_menu.start
  end

  def open_by_register(name, email, password)

  end

  private
  def create_user

  end

end
