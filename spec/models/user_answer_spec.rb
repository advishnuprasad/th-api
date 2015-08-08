require 'rails_helper'

RSpec.describe UserAnswer, :type => :model do
  context "Associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :question }
  end
end
