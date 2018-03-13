class MatUserArticleStat < ActiveRecord::Base
  def self.refresh(concurrently: false)
    if concurrently
      connection.execute("REFRESH MATERIALIZED VIEW CONCURRENTLY #{connection.quote_table_name(table_name)}")
    else
      connection.execute("REFRESH MATERIALIZED VIEW #{connection.quote_table_name(table_name)}")
    end
  end
end