class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.string :status, null: false
      t.string :exposure, null: false

      t.timestamps null: false
    end
    add_index :goals, :user_id
  end
end
