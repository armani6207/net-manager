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
        @network.update(network_params)
        redirect_to user_network_path(@user, @network)
    end

    def add_device_form
        find_network
        @ary = @network.device_array
        render 'add_device'
    end

    def add_device
        find_network
        @device = Device.find_or_create_by(params.permit(:name, :device_type))
        @network.devices << @device

        @device.connections.find_by(network_id: @network.id).update(device_nick_name: params[:nickname])

        redirect_to user_network_path(@user, @network)
    end

    def index
       find_user 
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