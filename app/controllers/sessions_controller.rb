class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:email])
        return head(:forbiden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/'
    end


end
