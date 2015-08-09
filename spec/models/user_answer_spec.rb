require 'rails_helper'

RSpec.describe UserAnswer, :type => :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :question }
  end

  describe '.build' do
    it "builds user answer" do
      question = FactoryGirl.create(:question)
      user = FactoryGirl.create(:user)
      ua = UserAnswer.build({user_id: user.id, question_id: question.id, answer: "random"})
      expect(ua.question).to eq(question)
      expect(ua.user).to eq(user)
      expect(ua.answer).to eq("random")
    end

    it "returns true if answer is correct" do
      question = FactoryGirl.create(:question)
      user = FactoryGirl.create(:user)
      ua = UserAnswer.build({user_id: user.id, question_id: question.id, answer: question.answer})
      expect(ua.check_answer?).to be_truthy
    end
  end
end
