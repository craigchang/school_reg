class AddPercentageToTasks < ActiveRecord::Migration
  def up
  	add_column :tasks, :score, :integer
  	add_column :tasks, :max_score, :integer
  end

  def down
  	remove_column :tasks, :max_score
		remove_column :tasks, :score
  end

end
