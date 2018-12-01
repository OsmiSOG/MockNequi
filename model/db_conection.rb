require 'mysql2'
class DBConection
  attr_accessor :client
  def initialize
      @client = Mysql2::Client.new(
      username: 'root',
      password: 'ossaOTGUE',
      host: 'localhost',
      port: '3306',
      s
      database: 'geek_ground'
    )
  end

end

con = DBConection.new
result = con.client.query('SELECT * FROM geek_ground.games;')
result.each do |i|
  puts i
end
