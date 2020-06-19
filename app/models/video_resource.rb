class VideoResource < ApplicationRecord
  has_many :courses_videos, dependent: :destroy
  has_many :course_resources, through: :courses_videos
end