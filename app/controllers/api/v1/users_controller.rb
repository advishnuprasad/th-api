module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.all
        respond_with @users
      end
    end
  end
end
