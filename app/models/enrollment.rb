class Enrollment < ActiveRecord::Base
	belongs_to :course
	belongs_to :student
	has_many :tasks

	def total_score
		return tasks.to_a.sum {|task| task.score}
	end

	def total_max_score
		return tasks.to_a.sum {|task| task.max_score}
	end

	def total_percentage
		if total_score().to_f <= 0 || total_max_score().to_f <= 0
			return "100.0"
		end

		return ((total_score().to_f / total_max_score().to_f) * 100.00).round(2)
	end
end
