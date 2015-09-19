class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.references :user, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :grade
      t.string :home_phone_number
      t.string :cell_phone_number
      t.string :email

      t.timestamps null: false
    end
  end

  def down
    drop_table :students
  end
end
