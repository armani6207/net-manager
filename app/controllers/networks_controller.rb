class NetworksController < ApplicationController
    before_action :require_login, only: [:new, :create]

    def new
        find_user
        @network = @user.networks.new
    end

    def create
        find_user
        @network = @user.networks.new(network_params)
        if @network.save
            redirect_to user_network_path(@user, @network)
        else
            render 'new'
        end
    end

    def show
        find_network
    end

    def edit
        find_network
    end

    def update
        find_network
        @network.assign_attributes(network_params)

        if @network.save
            redirect_to user_network_path(@user, @network)
        else
            render 'edit'
        end
    end

    def add_device_form
        find_network
        @connection = Connection.new
        @ary = @network.device_array
        render 'add_device'
    end

    def add_device
        find_network

        @device = Device.new
        
        if !params[:name].blank? & !params[:device_type].blank?
        @device = Device.find_or_create_by(params.permit(:name, :device_type))
        end

        @connection = Connection.new(device_id: @device.id, network_id: @network.id, )

        if !params[:nickname].blank?
        @connection.assign_attributes(device_nick_name: params[:nickname])
        end

        if @connection.save
            redirect_to user_network_path(@user, @network)
        else
            render 'add_device'
        end
    end

    def index
       find_user 
    end

    def destroy
        find_network
        @network.destroy
        redirect_to user_networks_path(@user)
    end

    private

    def network_params
        params.require(:network).permit(:name)
    end

    def find_network
        find_user
        @network = @user.networks.find(params[:id])
    end

    def find_user
        if params[:user_id].to_i == session[:user_id].to_i
            @user = User.find(session[:user_id])
        else
            return head(:forbidden)
        end
    end

end