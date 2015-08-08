class Question < ActiveRecord::Base

  validates_presence_of :title, :level, :answer
  default_scope { order("created_at DESC") }

  def self.first_level
    where(level: 1).first
  end

  def next_level
    Question.where(level: level + 1).first unless is_last_level?
  end
end
