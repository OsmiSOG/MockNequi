require 'mysql2'
require 'digest'
class DBConection
  attr_accessor :client
  def initialize
      @client = Mysql2::Client.new(
      username: 'root',
      password: '',
      host: 'localhost',
      port: '3306',
      socket: 'C:/xampp/mysql/mysql.sock',
      database: 'mock_nequi'
    )
  end

end

@db = DBConection.new
id=@db.client.query("select id from mock_nequi.users
  where email = 'oscarito@gmail.com'")
id.each { |e| puts e['id'] }
