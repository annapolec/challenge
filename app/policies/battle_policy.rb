class BattlePolicy < ApplicationPolicy
  def show?
    battle_member? || battle_owner?
  end

  def update?
    battle_owner?
  end

  def destroy?
    battle_owner?
  end

  private

  def battle_member?
    @record.id.in? @user.battles.pluck(:id)
  end

  def battle_owner?
    @record.owner == @user
  end
end