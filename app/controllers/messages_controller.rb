class MessagesController < ApplicationController

    def index 
        messages = Message.all 
        render json: messages
    end 

    def show
        message = Message.find(params[:id])
        render json: message
    end 

    def create
        message = Message.create(message_params)
        ActionCable.server.broadcast 'message_channel', params 
        render json: message 
    end 

    def destroy
        message = Message.find(params[:id])
        message.destroy
    end 

    private 
    def message_params
        params.require(:message).permit(:user_id, :text)
    end 
end
