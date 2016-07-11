class BattleMemberPolicy < ApplicationPolicy
  def create?
    battle_member? || battle_owner?
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
end