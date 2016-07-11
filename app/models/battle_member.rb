class BattleMember < ActiveRecord::Base
  belongs_to :member, polymorphic: true
  belongs_to :battle
  
  validates :battle_id, :member_id, :member_type, presence: true
end