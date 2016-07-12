class ChallengeMemberPolicy < ApplicationPolicy
  def create?
    battle_member? && !challenge_completed?
  end

  private

  def battle_member?
    (@record.challenge.battle.id.in? @user.battles.pluck(:id)) || (@record.challenge.battle.id.in? @user.groups.map { |group| group_battles(group.id) }.flatten)  
  end

  def group_battles(group_id)
    Group.find(group_id).battles.pluck(:id)
  end

  def challenge_completed?
    (@record.challenge.id.in? @user.challenge_members.where(challenge_id: @record.challenge).pluck(:challenge_id)) || (ChallengeMember.where(challenge_id: @record.challenge.id, member_type: "Group", member_id: group_members).any?)
  end

  def group_members
    @user.groups.select { |group| @record.challenge.battle.id.in? group.battles.pluck(:id) }.pluck(:id)
  end  
end