require 'rails_helper'

RSpec.describe CourseResourceAPI::API do 
  before(:all) do
    User.create({ username: "admin", digest_password: Digest::SHA1.hexdigest("admin123") })
  end

  after(:all) do
    CourseResource.destroy_all    
  end

  describe 'POST /new?username=admin&password=admin123&name=teste&author=teste&description=teste', type: :api do
    it 'returns ok' do
      new_course = double(CourseResource, persisted?: true)
      expect(CourseResource).to receive(:create)
        .with({ name: "teste", author: "teste", description: "teste" })
        .and_return(new_course)

      response_call = call_api
      expect(response_call.body).to eq("OK")
      expect(response_call.status).to eq(201)
    end
  end

  describe 'POST /new?username=admin&password=admin123&name=teste&author=teste&description=teste', type: :api do
    it 'returns course not created' do
      new_course = double(CourseResource, persisted?: false)
      expect(CourseResource).to receive(:create)
        .with({ name: "teste", author: "teste", description: "teste" })
        .and_return(new_course)

      response_call = call_api
      expect(response_call.body).to eq("course not created")
      expect(response_call.status).to eq(400)
    end
  end

  describe 'GET /list?username=admin&password=admin123&page_size=1&page_number=3&ordenation_type=created_at', type: :api do
    it 'returns a list of all courses by created_at' do
      names = ["will","al","laura"]
      courses = 3.times.map { |num| CourseResource.create( name: names[num], author: "teste", description: "teste") }

      response_call = call_api
      expect(response_call.body).to eq([
        [CourseResource.find_by(name: "will")],
        [CourseResource.find_by(name: "al")],
        [CourseResource.find_by(name: "laura")]
      ].to_json)
      expect(response_call.status).to eq(200)
    end
  end

  describe 'GET /list?username=admin&password=admin123&page_size=1&page_number=3&ordenation_type=name', type: :api do
    it 'returns a list of all courses by name' do
      names = ["al","bill","cecilia"]
      courses = 3.times.map { |num| CourseResource.create( name: names[num], author: "teste", description: "teste") }

      response_call = call_api
      expect(response_call.body).to eq([
        [CourseResource.find_by(name: "al")],
        [CourseResource.find_by(name: "bill")],
        [CourseResource.find_by(name: "cecilia")]
      ].to_json)
      expect(response_call.status).to eq(200)
    end
  end
end