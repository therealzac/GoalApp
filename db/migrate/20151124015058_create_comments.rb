class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.string :body, null: false
      t.integer :goal_id, null: false

      t.timestamps null: false
    end

    add_index :comments, :user_id
    add_index :comments, :goal_id
  end
end
