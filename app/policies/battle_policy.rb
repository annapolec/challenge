class BattlePolicy < ApplicationPolicy
  def show?
    battle_member?
  end

  def update?
    battle_member?
  end

  def destroy?
    battle_member?
  end

  private

  def battle_member?
    @record.id.in? @user.battles.pluck(:id)
  end
end