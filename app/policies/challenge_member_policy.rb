class ChallengeMemberPolicy < ApplicationPolicy
  def create?
    battle_member? && !challenge_completed?
  end

  private

  def battle_member?
    @record.challenge.battle.id.in? @user.battles.pluck(:id)
  end

  def challenge_completed?
    @record.challenge.id.in? @user.challenge_members.where(challenge_id: @record.challenge).pluck(:challenge_id)
  end
end