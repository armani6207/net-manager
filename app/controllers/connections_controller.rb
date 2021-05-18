class ConnectionsController < ApplicationController

    def destroy
        @connection = Connection.find(params[:id])
        @network = @connection.network
        @user = User.find(@connection.network.user_id)
        @connection.destroy

        redirect_to user_network_path(@user, @network)
    end

end