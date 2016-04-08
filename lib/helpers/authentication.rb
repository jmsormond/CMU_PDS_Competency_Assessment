module AssessmentHelpers
    module Authentication

        def login_user(user)
            session[:user] = user
        end

        def logout_user
            session[:user] = nil
        end

        def is_logged_in?
            return !session[:user].nil?
        end

    end
end