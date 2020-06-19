module VideoCourseAPI
  class API < Base

    params do
      requires :video_id, type: Integer
      requires :course_id, type: Integer
    end

    post :new do
      if admin_auth?(params[:password])
        new_join = CourseVideo.create(
          video_resource_id: params[:video_id],
          course_resource_id: params[:course_id]
        )

        if new_join&.persisted?
          "OK"
        else
          error! new_join.errors.messages.map {|k,v| "#{k} - #{v}" }.join(" "), 400
        end
      else
        error! "not connected as admin"
      end
    end
  end
end