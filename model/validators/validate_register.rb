require_relative 'menus/form_login'
require_relative 'model/db_conection'
require 'validate_register'
class ValidateRegister
  attr_accessor :access

    def initialize
      @access = false
    end

def validate_email(email)
      if validates_format_of :email, :with => /@/
        return true
      else 
        puts 'you have not entered a valid email address'
    end
      exist_account?
  end
     
  private
    def exist_account?
    account_database= return_element(@db_conection.query("SELECT 'id' FROM 'accounts' WHERE 'id'= '#{id}'"), 'id')
      if account_database != id
        puts ' this account already exists, try again'
      else
        puts 'valid account'
      end
    end


    def return_element(element, name)
      element.each do |i|
        return i[name]
      end
    end
  
  end
end

