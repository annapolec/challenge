class AddBattleMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :battle_members do |t|
        t.belongs_to :battle, index: true
        t.integer :member_id
        t.string  :member_type
        t.timestamps null: false
      end
   
      add_index :battle_members, :member_id
    end
end
