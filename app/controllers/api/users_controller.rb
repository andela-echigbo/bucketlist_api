module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token, only: :create

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: 201 # :created
      else
        render json: @user.errors.full_messages, status: 400
      end
    end

    def user_params
      params.permit(:name, :email, :password)
    end
  end
end
