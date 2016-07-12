class Ranking
  attr_accessor :results

  def initialize
    @results = {}
  end

  def sort
    @results = @results.sort_by { |key, value| value }.reverse.to_h
  end
end