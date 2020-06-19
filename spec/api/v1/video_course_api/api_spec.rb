require 'rails_helper'

RSpec.describe VideoCourseAPI::API do 
  before(:all) do
    User.create({ username: "admin", digest_password: Digest::SHA1.hexdigest("admin123") })
  end

  describe 'POST /new?username=admin&password=admin123&video_id=1&course_id=1', type: :api do
    it 'returns ok' do
      new_join = double(CourseVideo, persisted?: true)
      expect(CourseVideo).to receive(:create)
        .with({ video_resource_id: 1, course_resource_id: 1 })
        .and_return(new_join)

      response_call = call_api
      expect(response_call.body).to eq("OK")
      expect(response_call.status).to eq(201)
    end
  end

  describe 'POST /new?username=admin&password=admin123&video_id=1&course_id=1', type: :api do
    it 'returns course_id is missing' do
      new_join = double(CourseVideo, persisted?: false )
      errors = double(Array, messages: [{ course_resource_id: "must exists" }])
      expect(CourseVideo).to receive(:create)
        .with({ video_resource_id: 1, course_resource_id: 1 })
        .and_return(new_join)

      expect(new_join).to  receive(:errors)
        .and_return(errors)
      
      expect(call_api.status).to eq(400)
    end
  end
end