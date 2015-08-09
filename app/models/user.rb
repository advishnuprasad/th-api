class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_answers

  def next_level
    if user_answers.present?
      last_question_answered = user_answers.last.question
      last_question_answered.next_level
    else
      Question.first_level
    end
  end
end
