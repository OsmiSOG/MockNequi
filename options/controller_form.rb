require_relative 'model/validators/validate_form_login'
require_relative 'model/validators/validate_form_register'
class ControllerForm

  def initialize
    @validate_form_login = ValidateFormLogin.new
    @validate_form_register = ValidateFormregister.new
    @start_account = StartAccount.new
  end

  def form_login(email, password)
    @validate_form_login.validate_email(email)

    @validate_form_register.validate_password(password)

    @start_account.set_account(email)
  end

  def form_register(email)
    @r
  end


end
