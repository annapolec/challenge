class RankingController < ApplicationController
  def show
    @ranking = RankingService.new.general
    @ranking.sort
  end
end
