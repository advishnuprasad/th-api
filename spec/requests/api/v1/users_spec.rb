require "rails_helper"

RSpec.describe Api::V1::UsersController, :type => :request do
  describe 'GET /users' do
    context 'when unauthorised' do
      it "should return 401" do
        get api_users_path, nil, @env
        expect(response.status).to eq 401
      end
    end
    context 'when authorised' do
      it "should return 200" do
        login_user
        get api_users_path, nil, @env
        expect(response.status).to eq 200
      end
    end
  end
end
