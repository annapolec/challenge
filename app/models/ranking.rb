class Ranking
  attr_accessor :users_results, :groups_results, :battle_results

  def initialize
    @users_results = {}
    @groups_results = {}
    @battle_results = {}
  end

  def sort
    @users_results = @users_results.sort_by { |key, value| value }.reverse.to_h
    @groups_results = @groups_results.sort_by { |key, value| value }.reverse.to_h
    @battle_results = @battle_results.sort_by { |key, value| value }.reverse.to_h
  end

  def title_for(member_id, member_type)
    BattleMember.find_by(member_id: member_id, member_type: member_type).decorate.title
  end
end