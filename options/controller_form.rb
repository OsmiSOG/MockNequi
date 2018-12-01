require_relative 'model/validators/validate_form_login'
require_relative 'model/validators/validate_form_register'
class ControllerForm

  def initialize
    @validate_login = ValidateFormLogin.new
    @validate_register = ValidateFormregister.new
    @start_account = StartAccount.new
  end

  def form_login(email, password)
    @validate_login.validate_email(email)


    @validate_register.validate_password(password)

    @start_account.set_account(email)
  end

  def form_register(user, email, password)
    @validate_register.validate_email(email)
    @start_account.create_account(user, email, password)
    @start_account.set_account(email)
  end
end
