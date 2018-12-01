require_relative 'model/account'
require_relative 'menus/account_menu'
class StartAccount

  def initialize
    @account = Account.new
    @account_menu = AccountMenu.new
  end
  
  def create_account
  end

  def set_account(email)
    @account.getData(email)
    @account_menu.start
  end


end
