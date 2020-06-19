module CourseResourceAPI
  class API < Base

    params do
      requires :description, type: String
      requires :name, type: String
      requires :author, type: String
    end

    post :new do
      if admin_auth?(params[:password])
        new_course = CourseResource.create(
          description: params[:description], 
          name: params[:name],
          author: params[:author]
        )

        if new_course&.persisted?
          "OK"
        else
          error! "course not created", 400
        end
      else
        error! "not connected as admin", 500
      end
    end

    params do 
      optional :page_size, type: Integer
      optional :page_number, type: Integer
      requires :ordenation_type, type: String, values: ["name","created_at"]
      all_or_none_of :page_size, :page_number
    end

    get :list do 
      if admin_auth?(params[:password])
        pagination = true
        pagination = false if params[:page_number].nil? && params[:page_size].nil?
        number = params[:page_number]
        size = params[:page_size]

        courses = CourseResource.all
          .order(params[:ordenation_type])
          
        if pagination
          courses = courses.limit(number * size)
            .each_slice(size).to_a
        end
        courses.to_json
      else
        "not connected as admin"
      end
    end
  end
end