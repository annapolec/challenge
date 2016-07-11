class GroupUserPolicy < ApplicationPolicy
  def create?
    group_member?
  end

  private

  def group_member?
    @record.group.id.in? @user.groups.pluck(:id)
  end
end