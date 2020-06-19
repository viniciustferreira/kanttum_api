require 'rails_helper'

RSpec.describe VideoResourceAPI::API do 
  before(:all) do
    User.create({ username: "admin", digest_password: Digest::SHA1.hexdigest("admin123") })
  end

  describe 'POST /new?username=admin&password=admin123&name=teste&url=blabla&description=teste', type: :api do
    it 'returns ok' do
      new_video = double(VideoResource, persisted?: true)
      expect(VideoResource).to receive(:create)
        .with({ name: "teste", url: "blabla", description: "teste" })
        .and_return(new_video)

      response_call = call_api
      expect(response_call.body).to eq("OK")
      expect(response_call.status).to eq(201)
    end
  end

  describe 'POST /new?username=admin&password=admin123&name=teste&url=blabla&description=teste', type: :api do
    it 'returns user_not created' do
      new_video = double(VideoResource, persisted?: false)
      expect(VideoResource).to receive(:create)
        .with({ name: "teste", url: "blabla", description: "teste" })
        .and_return(new_video)

      response_call = call_api
      expect(response_call.body).to eq("video not created")
      expect(response_call.status).to eq(400)
    end
  end
end