class SessionsController < ApplicationController

    def new

        @user = User.new

    end

    def create
        if params[:user][:email].blank?
            @user = User.new
            render 'new'
        else
            @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/'
            else
                render 'new'
            end
        end
    end

    def facebook_callback
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password_digest = 0
        end

        session[:user_id] = @user.id

        redirect_to '/'
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end


end
