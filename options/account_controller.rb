class AccountController

  def initialize
    @user
    @account = Account.new
  end

  def initialize_account(user)
    @user = user
    @account.search_account(@user.id)
  end


end
