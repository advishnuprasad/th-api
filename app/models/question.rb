class Question < ActiveRecord::Base

  validates_presence_of :title, :level, :answer

  def self.first_level
    where(level: 1).first
  end

  def next_level
    Question.where(level: level + 1).first
  end
end
