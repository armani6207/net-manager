class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to '/'
        else
            render 'new'
        end
    end

    def show
        if params[:id].to_i == session[:user_id].to_i
            @user = User.find(session[:user_id])
        else
            return head(:forbidden)
        end

    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end