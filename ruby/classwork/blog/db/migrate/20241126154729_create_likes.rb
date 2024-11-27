class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end

    # uniqueness constraint a single like for a single user
    add_index :likes, [:user_id, :comment_id], unique: true
  end
end
