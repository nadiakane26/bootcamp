class CreateDonations < ActiveRecord::Migration[8.0]
  def change
    create_table :donations do |t|
      t.boolean :recurring, default: false

      t.timestamps
    end
  end
end
