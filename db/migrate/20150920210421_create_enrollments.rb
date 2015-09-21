class CreateEnrollments < ActiveRecord::Migration
  def up
    create_table :enrollments do |t|
    	t.references :student, index: true, foreign_key: true
    	t.references :course, index: true, foreign_key: true
    	t.string :grade
      t.timestamps null: false
    end

    add_index :enrollments, ["student_id", "course_id"]
  end

  def down
  	drop_table :enrollments
  end

end
