class ValidateRegister
  attr_accessor :access

  def initialize
    @access = false
  end

  def validate_email(email)

    exist_account?
  end

  private
  def exist_account?
    #query para validar si existe la cuenta
  end
end
