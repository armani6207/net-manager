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
        validate_user
    end

    def edit
        validate_user
    end

    def update
        validate_user
        
        if !params[:user][:new_password].blank?
            if @user.authenticate(params[:user][:password])
                @user.assign_attributes(user_params)
                @user.password = params[:user][:new_password]
                @user.save
                redirect_to user_path(@user)
            else
                render 'edit'
            end
        elsif params[:user][:new_password].blank?
            @user.assign_attributes(user_params)
            if @user.save
                redirect_to user_path(@user)
            else
                render 'edit'
            end
        end
    end

    def networks
        validate_user
    end



    private

    def validate_user
        if params[:id].to_i == session[:user_id].to_i
            @user = User.find(session[:user_id])
        else
            return head(:forbidden)
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end