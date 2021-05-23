module ApplicationHelper
    def logged_in?(session)
        !!session[:user_id]
    end

    def current_user(session)
        @user = User.find(session[:user_id])
    end

end
