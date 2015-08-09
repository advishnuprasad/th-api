class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  attr_accessor :answer

  default_scope { order("created_at ASC") }

  def self.build(params)
    new(params)
  end

  def check_answer?
    question.answer.downcase == answer.downcase
  end
end
