require 'rails_helper'

RSpec.describe User, :type => :model do
  it "ensures presence of :session_token" do
    user = User.new(username: "Nancy", password_digest: "abc")
    expect(user).to be_valid
  end

  it "uses BCrypt to encrypt passwords" do
    expect(BCrypt::Password).to receive(:create)
    FactoryGirl.build(:user)
  end
end
