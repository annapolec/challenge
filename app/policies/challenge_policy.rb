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
    @record.battle.id.in? @user.battles.pluck(:id)
  end

  def battle_owner?
    @record.battle.owner == @user
  end

  def completed_challenge?
    @record.id.in? @user.challenge_members.where(challenge_id: @record.id).pluck(:challenge_id)
  end
end