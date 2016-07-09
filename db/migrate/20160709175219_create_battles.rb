class CreateBattles < ActiveRecord::Migration[5.0]
  def change
    create_table :battles do |t|
      t.string :name
      t.integer :owner_id, index: true
      t.integer :mode

      t.timestamps null: false
    end
    add_foreign_key :battles, :users, column: :owner_id
  end
end
