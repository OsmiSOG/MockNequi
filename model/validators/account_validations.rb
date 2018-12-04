require_relative '../model/db_conection'

class AccountValidations

  def initialize
    @db_conection = DBConection.new
  end

  def email_correct?(email)
    email_db=nil
    @db_conection.client.query("SELECT email FROM mock_nequi.users
      WHERE email = '#{email}'").each { |e| email_db=e['email'] }

    if email_db == email
      return true
    else
      puts 'There has been a problem with the email entered'
      return false
    end
  end

end
