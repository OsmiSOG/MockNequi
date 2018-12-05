require_relative '../model/db_conection'
class GoalValidations

    def initialize
      @goals_exits
      @db = DBConection.new
    end

    def parameters_correct?(name, goal_balance, finish_at, account_id)
      if count_goals_same_name(account_id, name) <= 0
          if goal_balance > 0
            if date_format_correct?(finish_at)
              return true
            end
          end
      end
      return false
    end

    def in_progress?(account_id, name)
      @db.client.query("SELECT active FROM mock_nequi.goals
        WHERE account_id = #{account_id} AND name = '#{name}'").each do |active|
        if active['active'].to_i == 1
          return true
        end
      end
      return false
    end

    def count_goals_same_name(account_id, name)
      @num_pockets = 0
      if name.size > 0
        @db.client.query("SELECT COUNT(*) FROM mock_nequi.goals AS g
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

    private
    def date_format_correct?(date)
      @date = date.split('-')
      if @date[0].size == 4 && (@date[1].size == 2 || @date[1].size == 1) && (@date[0].size == 2 || @date[0].size == 1)
        if @date[0] >= Time.now.strftime("%Y").to_i && @date[1] >= Time.now.strftime("%m").to_i && @date[0] > Time.now.strftime("%d").to_i
          return true
        end
      end
      return false
    end
end
