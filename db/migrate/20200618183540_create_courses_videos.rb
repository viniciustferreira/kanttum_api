class CreateCoursesVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :courses_videos do |t|
      t.integer :video_resource_id, foreign_key: true
      t.integer :course_resource_id, foreign_key: true
    end
  end
end
