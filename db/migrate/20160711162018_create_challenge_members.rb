class CreateChallengeMembers < ActiveRecord::Migration[5.0]
 def change
    create_table :challenge_members do |t|
        t.belongs_to :challenge, index: true
        t.integer :member_id
        t.string  :member_type
        t.timestamps null: false
    end

    add_index :challenge_members, :member_id
  end
end
