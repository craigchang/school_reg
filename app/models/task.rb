class Task < ActiveRecord::Base
	belongs_to :enrollment

	validates :category, presence: true
	validates :name, presence: true
	validates :grade, presence: true
	validates :score, presence: true
	validates :max_score, presence: true

  validates_numericality_of :max_score, greater_than_or_equal_to: :score
end
