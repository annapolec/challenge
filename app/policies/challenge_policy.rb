class ChallengePolicy < ApplicationPolicy
  def create?
    battle_member?
  end

  def show?
    battle_member?
  end

  def index?
    battle_member?
  end

  def complete_challenge?
    battle_member? && !completed_challenge?
  end

  private

  def battle_member?
    @record.battle.id.in? @user.battles.pluck(:id)
  end

  def completed_challenge?
    @record.id.in? @user.challenge_members.where(challenge_id: @record.id).pluck(:challenge_id)
  end
end