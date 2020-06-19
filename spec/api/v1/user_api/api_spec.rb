require 'rails_helper'

RSpec.describe UserAPI::API do 
  before(:all) do
    User.create({ username: "admin", digest_password: Digest::SHA1.hexdigest("admin123") })
  end

  describe 'POST /new?username=admin&password=admin123&new_username=vinicius&new_user_password=123456', type: :api do
    it 'returns ok when create a user' do
      new_user = double(User, persisted?: true)
      expect(User).to receive(:create)
        .with({ username: "vinicius", digest_password: Digest::SHA1.hexdigest("123456")})
        .and_return(new_user)

      response_call = call_api
      expect(response_call.body).to eq("OK")
      expect(response_call.status).to eq(201)
    end
  end

  describe 'POST /new?username=admin&password=admin123&new_username=vinicius&new_user_password=123456', type: :api do
    it 'returns user_not created' do
      new_course = double(User, persisted?: false)
      expect(User).to receive(:create)
        .with({ username: "vinicius", digest_password: Digest::SHA1.hexdigest("123456")})
        .and_return(new_course)

      response_call = call_api
      expect(response_call.body).to eq("user not created")
      expect(response_call.status).to eq(400)
    end
  end
end