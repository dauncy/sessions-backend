class MessagesController < ApplicationController

    def create
        message = Message.new(message_params)
        session = Session.find(message_params[:session_id])
        if message.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
          ).serializable_hash
          MessagesChannel.broadcast_to session, serialized_data
          head :ok
        end
      end
      
      private
      
      def message_params
        params.require(:message).permit(:text, :session_id)
      end
end
