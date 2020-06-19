class CourseVideo < ApplicationRecord
  self.table_name = "courses_videos"
  belongs_to :video_resources
  belongs_to :course_resources
end