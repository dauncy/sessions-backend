class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users 
    end 

    def show
        user = User.find(params[:id])
        render json: user
    end 

    def create
        user = User.create(user_params)
        byebug
        if user.valid?
            render json: user
        else 
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end 
    end 

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end 

    def destroy
        user = User.find(params[:id])
        user.destroy
    end 

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :bio, :location)
    end 
end
