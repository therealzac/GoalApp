require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign up")
  end

  feature "signing up a user" do

    def sign_up
      user = FactoryGirl.build(:user)
      visit new_user_url
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_button "Sign up"
      user
    end

    it "shows username on the homepage after signup" do
      user = sign_up
      expect(page).to have_content(user.username)
    end

    it "has a sign out button when logged in" do
      sign_up
      expect(page).to have_button("Sign out")
    end

    it "validates presence of password" do
      user = FactoryGirl.build(:user)
      visit new_user_url
      fill_in "username", with: user.username
      click_button "Sign up"
      expect(page).to have_content("Password is too short")
    end

    it "validates presence of username" do
      user = FactoryGirl.build(:user)
      visit new_user_url
      fill_in "password", with: user.password
      click_button "Sign up"
      expect(page).to have_content("Username can't be blank")
    end
  end

end

  def login
    user = FactoryGirl.build(:user)
    visit new_session_url
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button "Sign in"
    user
  end

feature "logging in" do

  it "shows username on the homepage after login" do
    user = login
    expect(page).to have_content(user.username)
  end


end

feature "logging out" do

  it "begins with logged out state" do
    visit new_session_url
    expect(page).to_not have_button("Sign out")
  end

  it "doesn't show username on the homepage after logout" do
    user = login
    click_button "Sign out"
    expect(page).to_not have_content(user.username)
  end

end
