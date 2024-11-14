class AddAuthorToArticles < ActiveRecord::Migration[8.0]
  def change
    add_reference :articles, :author, null: true, foreign_key: true
  end
end
