class Challenge < ActiveRecord::Base
  belongs_to :battle
  
  validates :name, :points, presence: true
  validates :points, numericality: { greater_than: 0 }
end