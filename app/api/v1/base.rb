class Base < Grape::API

  before do
    authenticate(params[:username], params[:password])
  end

  helpers do
    def admin_auth?(password)
      @admin ||= true unless User.where(username: 'admin', digest_password: Digest::SHA1.hexdigest(password)).empty?
    end

    def authenticated?
      return false if @authenticated.nil? || @authenticated == false
      true
    end

    def authenticate(username, password)
      @authenticated ||= true unless User.where(username: username, digest_password: Digest::SHA1.hexdigest(password)).empty?
    end
  end

  params do
    requires :username, type: String
    requires :password, type: String
  end
end