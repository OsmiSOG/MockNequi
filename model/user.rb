require_relative '../model/db_conection'
class User

  attr_accessor :id, :name, :email

  def initialize(email)
    @id
    @name
    @email = email
    @db = DBConection.new
    acces_user_db
  end

  private
  def acces_user_db
    user=@db.client.query("select id, name from mock_nequi.users
      where email = #{@email}")
    user.each do |row|
      @id = row['id']
      @name = row['name']
    end
  end
end
