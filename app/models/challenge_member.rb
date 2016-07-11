class ChallengeMember < ActiveRecord::Base
  belongs_to :member, polymorphic: true
  belongs_to :challenge
  
  validates :challenge_id, :member_id, :member_type, presence: true
end