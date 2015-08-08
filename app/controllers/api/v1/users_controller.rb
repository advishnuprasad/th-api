module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def index
        @users = User.all
        respond_with @users
      end
    end
  end
end
