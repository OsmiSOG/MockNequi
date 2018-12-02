require_relative '../model/validators/validate_login'
require_relative '../model/validators/validate_register'
require_relative '../menus/form_login'
require_relative '../menus/form_register'
require_relative 'access_account'

class FormController

  def initialize
    @form_login = FormLogin.new
    @form_register = FormRegister.new
    @validate_login = ValidateLogin.new
    @validate_register = ValidateRegister.new
    @access_account = AccessAccount.new
  end

  def start_login
    @form_login.request_information
    @validate_login.validate_information(@form_login.email, @form_login.password)
    @validate_login.determine_access
    if @validate_login.access
      @access_account.open_by_login(@form_login.email)
    end
  end

  def start_register
    @form_register.request_information
    @validate_register.validate_email(@form_register.email)
    if @validate_register.access
      @access_account.open_by_register(@form_register.name, @form_register.email, @form_register.password)
    end
  end
end
