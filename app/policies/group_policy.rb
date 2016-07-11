class GroupPolicy < ApplicationPolicy
  def show?
    group_member?
  end

  private

  def group_member?
    @record.id.in? @user.groups.pluck(:id)
  end
end