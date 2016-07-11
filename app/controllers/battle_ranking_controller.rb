class BattleRankingController < ApplicationController
  def show
    @ranking = RankingService.new.for_battle(params[:battle_id])
  end
end