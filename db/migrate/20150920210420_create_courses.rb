class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
    	t.string :course_number
    	t.string :name
    	t.string :description
      t.timestamps null: false
    end

    Course.create(course_number: 'CC099', name: 'Cartoon Animation', description: 'Learn how to create cartoons.')
    Course.create(course_number: 'CC010', name: 'Chess I', description: 'Learn how to be a chess champion.')
    Course.create(course_number: 'CC100', name: 'Chinese Calligraphy', description: 'Learn how to write proper Chinese characters')
    Course.create(course_number: 'CC101', name: 'Chinese Conversation 101', description: 'Learn how to hold basic conversations in Chinese')

    add_index :courses, ['name']
  end

  def down
  	drop_table :courses
  end
end
