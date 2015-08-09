class QuestionSerializer < ActiveModel::Serializer

  attributes :id, :image_url, :title, :description, :level, :is_last_level

end
