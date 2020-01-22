class SessionsController < ApplicationController

    def index
        sessions = Session.all
        render json: sessions
    end

    def create
        session = Session.create(session_params)
        if session.save
            render json: session
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
                SessionsSerializer.new(session)
              ).serializable_hash
            ActionCable.server.broadcast 'sessions_channel', serialized_data
            head :ok
            end 
    end 

    private 
    def session_params
        params.require(:session).permit(:title)
    end 
end
