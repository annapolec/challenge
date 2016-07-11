class BattleMember < ActiveRecord::Base
  validates :battle_id, :member_id, :member_type, presence: true
end