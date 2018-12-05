require 'mysql2'

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
