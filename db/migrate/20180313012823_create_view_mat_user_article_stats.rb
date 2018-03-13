class CreateViewMatUserArticleStats < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE MATERIALIZED VIEW mat_user_article_stats AS
      SELECT
        u.id,
        u.name,
        COUNT(a.*) AS article_count,
        COUNT(a.*) FILTER (WHERE a.published_at IS NULL) AS draft_count,
        COUNT(a.*) FILTER (WHERE a.published_at IS NOT NULL) AS published_count
      FROM users u
      LEFT JOIN articles a ON a.user_id = u.id
      GROUP BY u.id
    SQL
  end

  def down
    execute <<~SQL
      DROP VIEW mat_user_article_stats
    SQL
  end
end
