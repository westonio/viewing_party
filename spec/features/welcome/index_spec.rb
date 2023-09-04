# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  before :each do
    @user_1 = User.create!(name: 'Michael', email: 'michaelisvcool@email.com', password: 'test123!', password_confirmation: 'test123!')
    @user_2 = User.create!(name: 'Sara', email: 'sara1234@email.com', password: 'test123!', password_confirmation: 'test123!')
    @user_3 = User.create!(name: 'Elena', email: 'iheartmydogs@email.com', password: 'test123!', password_confirmation: 'test123!')
  end

  describe "When visiting the root path '/'" do
    it 'has the title of the application' do
      visit root_path

      within('div#title') do
        expect(page).to have_content('Viewing Party')
      end
    end

    it 'has a list of the Existing Users' do
      visit root_path

      within('div#all-users') do
        expect(page).to have_content('michaelisvcool@email.com')
        expect(page).to have_content('sara1234@email.com')
        expect(page).to have_content('iheartmydogs@email.com')
      end
    end

    it 'Each user listed is a link to that users dashboards' do
      visit root_path

      within('div#all-users') do
        expect(page).to have_link(@user_1.email, href: user_path(@user_1))
        expect(page).to have_link(@user_2.email, href: user_path(@user_2))
        expect(page).to have_link(@user_3.email, href: user_path(@user_3))
      end
    end

    it "has a link to go to the home page '/' " do
      visit root_path

      within('#nav-bar') do
        expect(page).to have_link('Home', href: root_path)
      end
    end

    it 'has a button to create a new user' do
      visit root_path

      within('div#user-buttons') do
        expect(page).to have_button('Create an Account')
        click_button('Create an Account')
      end

      expect(current_path).to eq(register_path)
    end

    it 'has a button for existing users to login' do
      visit root_path

      within('div#user-buttons') do
        expect(page).to have_button('Sign In')
        click_button('Sign In')
      end

      expect(current_path).to eq(login_path)
    end
  end
end
