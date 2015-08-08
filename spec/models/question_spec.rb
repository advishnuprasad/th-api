require 'rails_helper'

RSpec.describe Question, :type => :model do
  context "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :level }
    it { is_expected.to validate_presence_of :answer }
  end

  describe '#first_level' do
    it "should return level 1 question" do
      level_1_question = FactoryGirl.create(:question)
      expect(Question.first_level).to eq(level_1_question)
    end

    it "should return whether question is last level or not" do
      last_level_question = FactoryGirl.create(:question, is_last_level: true)
      expect(last_level_question.is_last_level).to eq(true)
    end

    it "should return next level question" do
      level_1_question = FactoryGirl.create(:question)
      level_2_question = FactoryGirl.create(:question, level: 2)
      expect(level_1_question.next_level).to eq(level_2_question)
    end
  end
end
