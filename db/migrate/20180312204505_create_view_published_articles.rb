class CreateViewPublishedArticles < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE VIEW published_articles AS
        SELECT
          id,
          user_id,
          title,
          published_at
        FROM
          articles
        WHERE published_at IS NOT NULL
    SQL
  end

  def down
    execute <<~SQL
      DROP VIEW published_articles
    SQL
  end
end
