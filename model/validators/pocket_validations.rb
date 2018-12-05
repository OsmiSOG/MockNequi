require_relative '../model/db_conection'

class PocketValidations

    #cuenta del bolsillo
    #validar
    #no se pueden eliminar bolsillos si no hay bolsillo existentes
    #no se puede retirar dinero de un bolsillo si no hay saldo
    #no se puede retirar un monto mayor al saldo existente en el bolsillo
    #no se puede enviar una cantidad de dinero a otra cuenta mayor a la cantidad que hay en el bolsillo
    def initialize
      @db = DBConection.new
      @num_pockets
    end

    def count_pockets(account_id)
      @num_pockets = 0
      @db.client.query("SELECT COUNT(*) FROM mock_nequi.pockets AS p
        JOIN mock_nequi.accounts AS a
        ON p.account_id = #{account_id}").each do |column|
        num_pockets = column['COUNT(*)']
      end
      return @num_pockets
    end

    def count_pockets_same_name(account_id, name)
      @num_pockets = 0
      if name.size > 0
        @db.client.query("SELECT COUNT(*) FROM mock_nequi.pockets AS p
          JOIN mock_nequi.accounts AS a
          ON p.account_id = #{account_id}
          WHERE p.name = #{name}").each do |column|
          @num_pockets = column['COUNT(*)']
        end
      else
        puts "you did not write any name."
      end
      return @num_pockets
    end
end
