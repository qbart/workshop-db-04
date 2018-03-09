class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.belongs_to :user, null: false, index: true
      t.string :title, null: false
      t.date :published_at, null: true
    end

    add_foreign_key :articles, :users, on_delete: :cascade, on_update: :cascade
  end
end
