class CourseResource < ApplicationRecord
  has_many :courses_videos, dependent: :destroy
  has_many :video_resources, through: :courses_videos
end