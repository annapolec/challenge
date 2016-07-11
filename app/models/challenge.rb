class Challenge < ActiveRecord::Base
  validates :name, :points, presence: true
  validates :points, numericality: { greater_than: 0 }
end