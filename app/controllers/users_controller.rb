class UsersController < ApplicationController

    def new
        @user = user.new
    end

    def create
        unless User.exists?(email: params[:email])
            User.create(user_params)
        else
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end