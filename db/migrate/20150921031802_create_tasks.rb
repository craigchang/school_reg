class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
    	t.references :enrollment, index: true, foreign_key: true
    	t.string :category
    	t.string :name
    	t.boolean :is_submitted
    	t.string :grade
      t.timestamps null: false
    end
  end

  def down
  	drop_table :tasks
  end
end
