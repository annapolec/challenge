class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges
  belongs_to :owner, class_name: 'User'

  validates :name, :owner_id, presence: true
  enum mode: %w(for_users for_groups)

  def persisted_members
    BattleMemberDecorator.decorate_collection(battle_members.select(&:persisted?))
  end

  def persisted_challenges
    challenges.select(&:persisted?)
  end

  def not_assigned_members
    mode == "for_users" ? User.where.not(id: self.battle_members.pluck(:member_id)) : Group.where.not(id: self.battle_members.pluck(:member_id))
  end
end