module UserAPI
  class API < Base

    params do
      requires :new_username, type: String
      requires :new_user_password, type: String
    end

    post :new do
      if admin_auth?(params[:password])
        new_user = User.create(username: params[:new_username], digest_password: Digest::SHA1.hexdigest(params[:new_user_password]))
        if new_user.persisted?
          "OK"
        else
          error! "user not created", 400
        end
      else
        error! "not connected as admin", 400
      end
    end
  end
end