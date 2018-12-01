require_relative 'model/validators/validate_form_login'
require_relative 'model/validators/validate_form_register'
class FormController

  def initialize
    @form_login = FormLogin.new
    @form_register = FormRegister.new
    @validate_login = ValidateFormLogin.new
    @validate_register = ValidateFormregister.new
    @access_account = AccesAccount.new
  end

  def start_login
    @form_login.request_information
    @validate_login.validate_information(@form_login.email, @form_login.password)
    @validate_login.determine_access
    if @validate_login.access
      @access_account.open_by_login(email)
    end
  end

  def start_register
    @form_register.request_information
    @validate_register.validate_email(@form_register.email)
    @acces_account.open_by_register(@form_register.user, @form_register.email, @form_register.password)
  end
end
