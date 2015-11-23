require 'rails_helper'

RSpec.describe Goal, :type => :model do
  feature "New goal page" do
    it "has a content field" do
      login
      visit new_goal_url
      expect(page).to have_field("Goal")
    end

    it "has exposure dropdown" do
      login
      visit new_goal_url
      expect(page).to have_field("Exposure")
    end

    it "validates the presence of goal content" do
      login
      visit new_goal_url
      click_button "Make goal"
      expect(page).to have_content("Content can't be blank")
    end

  end

  feature "Goals index page" do
    it "Doesn't show private goals that don't belong to current user" do
      login
      goal = FactoryGirl.create(:private_goal)
      visit new_goal_url
      fill_in "Goal", with: goal.content
      select('Private', from: 'Exposure')
      click_button "Make goal"
      click_button "Sign out"
      login
      visit goals_url
      expect(page).to_not have_content(goal.content)
    end

    it "Shows private goals if they belong to the current user" do
      login
      goal = FactoryGirl.create(:private_goal)
      visit new_goal_url
      fill_in "Goal", with: goal.content
      select('Private', from: 'Exposure')
      click_button "Make goal"
      expect(page).to have_content(goal.content)
    end

    it "Has a button to add new goals" do
      visit goals_url
      expect(page).to have_button("New goal")
    end

    it "allows user to edit their goals" do
      login
      goal = FactoryGirl.create(:private_goal)
      visit new_goal_url
      fill_in "Goal", with: goal.content
      select('Private', from: 'Exposure')
      click_button "Make goal"
      expect(page).to have_button("Edit")
    end
  end

end
