class CreateParentsStudentsJoin < ActiveRecord::Migration
  def up
    create_table :parents_students, :id => false do |t|
      t.references :student, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true
    end

    add_index :parents_students, ["student_id", "parent_id"]
  end

  def down
  	drop_table :parents_students
  end
end
