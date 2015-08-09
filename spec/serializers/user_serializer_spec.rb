require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do

  context 'Individual Resource Representation' do
    let(:resource)   { build(:user) }
    let(:params)     { ActionController::Parameters.new(action: "create", controller: "devise/sessions") }
    let(:scope)      { ApplicationController.new }
    let(:serializer) { UserSerializer.new(resource, scope: scope) }

    subject do
      JSON.parse(serializer.to_json)['user']
    end

    before(:each) do
      allow(scope).to receive(:params) { params }
    end

    it 'has an id' do
      expect(subject['id']).to eql(resource.id)
    end

    it 'has an email' do
      expect(subject['email']).to eql(resource.email)
    end

    it 'has an auth token if requested from signin' do
      expect(subject['auth_token']).to eql(resource.authentication_token)
    end

    it 'doesn\'t have an auth token if not requested from signin' do
      allow(scope).to receive(:params) { {} }
      expect(subject['auth_token']).to be_nil
    end
  end
end
