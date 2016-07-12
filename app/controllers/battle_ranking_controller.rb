class BattleRankingController < ApplicationController
  def show
    @ranking = RankingService.new.for_battle(params[:battle_id])
    @ranking.sort
    @battle = Battle.find(params[:battle_id]).decorate
  end
end