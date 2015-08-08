require "rails_helper"

RSpec.describe User do

  describe "Validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe '#next_level' do
    it "should return first question for new user" do
      user = FactoryGirl.create(:user)
      first_question = FactoryGirl.create(:question)
      expect(user.next_level).to eq(first_question)
    end

    it "should return nil if all questions answered" do
      user = FactoryGirl.create(:user)
      first_question = FactoryGirl.create(:question, is_last_level: true)
      user.user_answers << UserAnswer.new(question: first_question)
      expect(user.next_level).to be_nil
    end

    it "should return next level question" do
      q1 = FactoryGirl.create(:question, level: 1)
      q2 = FactoryGirl.create(:question, level: 2)
      q3 = FactoryGirl.create(:question, level: 3)
      q4 = FactoryGirl.create(:question, level: 4)
      user = FactoryGirl.create(:user)
      user.user_answers << UserAnswer.new(question: q1, created_at: Time.zone.now - 1.day)
      user.user_answers << UserAnswer.new(question: q2, created_at: Time.zone.now)
      expect(user.next_level).to eq(q3)
    end
  end
end
