class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges

  enum mode: [ :for_users, :for_group ]

  def persisted_members
    battle_members.select(&:persisted?)
  end

  def persisted_challenges
    challenges.select(&:persisted?)
  end
end