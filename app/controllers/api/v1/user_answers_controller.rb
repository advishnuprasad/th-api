module Api
  module V1
    class UserAnswersController < ApplicationController

      def create
        @user_answer = UserAnswer.build(create_params)
        if @user_answer.check_answer? && @user_answer.save
          render json: { answer: true }
        else
          render json: { answer: false }
        end
      end

      private
      def create_params
        params.require(:user_answer).permit(:user_id, :question_id, :answer)
      end
    end
  end
end
