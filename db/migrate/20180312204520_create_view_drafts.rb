class CreateViewDrafts < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE VIEW drafts AS
        SELECT
          id,
          user_id,
          title
        FROM
          articles
        WHERE published_at IS NULL
    SQL
  end

  def down
    execute <<~SQL
      DROP VIEW drafts
    SQL
  end
end
