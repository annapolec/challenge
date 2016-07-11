class ChallengeMember < ActiveRecord::Base
  validates :challenge_id, :member_id, :member_type, presence: true
end