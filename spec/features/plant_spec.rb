require "rails_helper"

RSpec.describe "plant index page" do
  before :each do
    @plant1 = Plant.create(name: "Tomatoes", days: 85, distance: 24, sun: "full")
    @plant2 = Plant.create(name: "Zucchini", days: 70, distance: 12, sun: "full to partial")
    @plant3 = Plant.create(name: "Corn", days: 100, distance: 6, sun: "full")
  end

  context "as a visitor who wants to log in" do
    it "should register a user successfully" do
      visit plants_path
      click_link "Register"
      expect(current_path).to eq(new_user_path)

      fill_in "Name", with: "Corey Sheesley"
      fill_in "Email address", with: "corey@gmail.com"
      fill_in "Password", with: "abcd1234"
      fill_in "Password confirmation", with: "abcd1234"
      click_button "Create User"
      user = User.last
      expect(current_path).to eq(login_path)
    end

    it "should log the user in successfully" do
      visit new_user_path
      fill_in "Name", with: "Corey Sheesley"
      fill_in "Email address", with: "corey@gmail.com"
      fill_in "Password", with: "abcd1234"
      fill_in "Password confirmation", with: "abcd1234"
      click_button "Create User"
      user = User.last

      fill_in "Email", with: user.email_address
      fill_in "Password", with: user.password
      click_button "Login"
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.name}!")
    end

    it "should log out the user" do
      visit login_path
      @user = User.create(name: "Corey Sheesley", email_address: "corey@gmail.com", password: "abcd1234")
      fill_in "Email", with: @user.email_address
      fill_in "Password", with: @user.password
      click_button "Login"
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      # visit user_path(@user)
      click_link "Logout"
      expect(current_path).to eq(plants_path)
      # expect(session[:user_id]).to eq(nil)
      visit user_path(@user)
      # expect(page).to_not have_content("Corey")
    end
  end


  context "as a visitor to the site" do
    it "should have a list of all plants" do
      visit plants_path
      expect(page).to have_content("Plants:")
      within first ".plant-card" do
        expect(page).to have_content("#{@plant1.name}")
        expect(page).to have_content("Days to maturity: #{@plant1.days}")
        expect(page).to have_content("Distance between plants: #{@plant1.distance} in")
        expect(page).to have_content("Sun exposure: #{@plant1.sun}")
      end
      expect(page).to have_css(".plant-card", count: 3)
    end
  end

  context "as a visitor who wants to add a plant" do
    describe "on the index page" do
      it "should have a new plant link" do
        visit plants_path
        expect(page).to have_link("Add Plant")

        click_link "Add Plant"
        expect(current_path).to eq(new_plant_path)
      end
    end

    describe "new plant page" do
      it "should create a new plant" do
        visit new_plant_path
        fill_in "Name", with: "Peas"
        fill_in "Days", with: "90"
        fill_in "Distance", with: 24
        fill_in "Sun", with: "Partial"
        click_button "Create Plant"

        plant = Plant.last
        expect(current_path).to eq(plant_path(plant))
        expect(page).to have_content("Peas")
      end

    end
  end
end
