class RankingController < ApplicationController
  def show
    @ranking = RankingService.new.general
  end
end
