class Question < ActiveRecord::Base

  FILESIZE_LIMIT = 2.megabytes

  mount_uploader :image, ImageUploader

  validates_presence_of :level, :answer, :image
  validate :image_size

  default_scope { order("created_at DESC") }

  def image_size
    if image.file.size > FILESIZE_LIMIT
      errors.add(:file, "You cannot upload a file greater than #{FILESIZE_LIMIT} MB")
    end
  end

  def self.first_level
    where(level: 1).first
  end

  def next_level
    Question.where(level: level + 1).first unless is_last_level?
  end
end
