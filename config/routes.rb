Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount UserAPI::API => '/v1/user/'
  mount CourseResourceAPI::API => '/v1/course_resource/'
  mount VideoResourceAPI::API => '/v1/video_resource/'
  mount VideoCourseAPI::API => '/v1/video_course/'
end
