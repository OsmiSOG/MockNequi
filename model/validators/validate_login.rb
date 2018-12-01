class ValidateLogin

  attr_accesor :access

  def initialize
    @correct_email = false
    @correct_password = false
    @access = false
  end

  def validate_information(email, password)
    validate_email(email)
    validate_password(password)
  end

  def determine_access


  end

  private
  def validate_email(email)

  end

  def validate_password(password)

  end

end
