require 'db_conection'
class ValidateLogin

  attr_accessor :access

  def initialize
    @correct_email = false
    @correct_password = false
    @access = false
  end

  def validate_information(email, password)
    @correct_email=validate_email(email)
    @correct_email=validate_exits_email(email)
    @correct_password=validate_password(email, password)
  end

  def determine_access
    if @correct_email and @correct_password
      @access = true
    end
  end

  private
  def validate_email(email)
    if validates_format_of :email, :with => /@/
      return true
    else
      puts 'you have not entered a valid email address'
      return false
    end
  end

  def validate_exits_email(email)
    email_database= return_element(@db_conection.query("SELECT 'email' FROM 'users' WHERE 'id'= '#{id}'")), email)
    if email_database == email
      return true
    else
      puts 'This email no exist'
    end
  end

  def validate_password(email, password)
    password_database = return_element(@db_conection.query("SELECT 'password' FROM 'users' WHERE 'id' = '#{id}'"), 'password')
    if password_database == password
      return true
    else
      puts 'Invalid password'
      return false
    end
  end

  def return_element(element, name)
    element.each do |i|
      return i[name]
    end
  end


end
