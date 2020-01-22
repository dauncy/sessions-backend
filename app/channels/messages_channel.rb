# app/channels/chat_channel.rb
class MessagesChannel < ApplicationCable::Channel
    def subscribed
        session = Session.find(params[:session])
        stream_for session
    end
end
 
