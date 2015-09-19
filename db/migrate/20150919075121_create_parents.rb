class CreateParents < ActiveRecord::Migration
  def up
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation

      t.timestamps null: false
    end
  end

  def down
  	drop_table :parents
  end

end
