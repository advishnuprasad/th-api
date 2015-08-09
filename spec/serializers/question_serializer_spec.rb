require 'rails_helper'

RSpec.describe QuestionSerializer, :type => :serializer do

  context 'Individual Resource Representation' do
    let(:resource)   { build(:question) }
    let(:scope)      { ApplicationController.new }
    let(:serializer) { QuestionSerializer.new(resource, scope: scope) }

    subject do
      JSON.parse(serializer.to_json)['question']
    end

    it 'has an id' do
      expect(subject['id']).to eql(resource.id)
    end

    it 'has an title' do
      expect(subject['title']).to eql(resource.title)
    end

    it 'has an description' do
      expect(subject['description']).to eql(resource.description)
    end

    it 'has an image_url' do
      expect(subject['image_url']).to eql(resource.image_url)
    end

    it 'has an level' do
      expect(subject['level']).to eql(resource.level)
    end

    it 'doesn\'t have an answer' do
      expect(subject['answer']).to be_nil
    end
  end
end
