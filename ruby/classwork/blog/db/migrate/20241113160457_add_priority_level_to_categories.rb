class AddPriorityLevelToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :priority_level, :integer
  end
end
