class AddChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :desc
      t.integer :points
      t.integer :owner_id, index: true
      t.belongs_to :battle, index: true
      
      t.timestamps null: false
    end
    add_foreign_key :challenges, :users, column: :owner_id
  end
end
