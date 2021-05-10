class NetworksController < ApplicationController
    def new
        @network = Network.new
    end

    def create
        find_network

        @network.new(network_params)
        if @network.save
            redirect_to network_path(@network)
        else
            render 'new'
        end

    end

    def show
        find_network
    end

    private

    def network_params
        require(:network).permit(:name)
    end

    def find_network
        @network = Network.find(params[:id])
    end

end