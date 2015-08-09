module RequestMacros
  include Warden::Test::Helpers

  # for use in request specs
  def login_user(user = FactoryGirl.create(:user))
    login_as user
  end
end
