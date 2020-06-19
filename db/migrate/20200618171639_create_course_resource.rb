class CreateCourseResource < ActiveRecord::Migration[6.0]
  def change
    create_table :course_resources do |t|
      t.string :description
      t.string :name
      t.string :author
      t.timestamps
    end
  end
end
