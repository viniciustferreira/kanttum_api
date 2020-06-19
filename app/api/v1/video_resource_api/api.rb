module VideoResourceAPI
  class API < Base

    params do
      requires :description, type: String
      requires :name, type: String
      requires :url, type: String
    end

    post :new do
      if admin_auth?(params[:password])
        new_video = VideoResource.create(
          description: params[:description], 
          name: params[:name],
          url: params[:url]
        )

        if new_video&.persisted?
          "OK"
        else
          error! "video not created", 400
        end
      else
        error! "not connected as admin", 405
      end
    end
  end
end