class BattleMemberDecorator < Draper::Decorator
  delegate_all

  def title
    member_type == 'User' ? object.member.email : object.member.name
  end
end