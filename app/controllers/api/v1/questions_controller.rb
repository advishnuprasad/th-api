module Api
  module V1
    class QuestionsController < ApplicationController

      def index
        @questions = Question.all
        respond_with @questions
      end

      def show
        @question = Question.find(params[:id])
        respond_with @question
      end

      def create
        @question = Question.new(create_params)
        @question.save
        respond_with @question, location: nil
      end

      private
      def create_params
        params.require(:question).permit(:title, :description, :image, :level, :answer, :is_last_level)
      end
    end
  end
end
