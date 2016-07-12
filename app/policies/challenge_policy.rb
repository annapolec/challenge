class ChallengePolicy < ApplicationPolicy
  def create?
    battle_member? || battle_owner?
  end

  def show?
    battle_member? || battle_owner?
  end

  def index?
    battle_member? || battle_owner?
  end

  def complete_challenge?
    battle_member? && !completed_challenge?
  end

  def destroy?
    battle_owner?
  end

  private

  def battle_member?
    (@record.battle.id.in? @user.battles.pluck(:id)) || (@record.battle.id.in? @user.groups.map { |group| group_battles(group.id) }.flatten)
  end

  def group_battles(group_id)
    Group.find(group_id).battles.pluck(:id)
  end

  def battle_owner?
    @record.battle.owner == @user
  end

  def completed_challenge?
    (@record.id.in? @user.challenge_members.where(challenge_id: @record.id).pluck(:challenge_id)) || (ChallengeMember.where(challenge_id: @record.id, member_type: "Group", member_id: group_members).any?)
  end

  def group_members
    @user.groups.select { |group| @record.battle.id.in? group.battles.pluck(:id) }.pluck(:id)
    # user nalezy do grupy
    # grupypa nalezy do bitwy
  end  
end