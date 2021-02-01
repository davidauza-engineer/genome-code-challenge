# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'City searching', type: :feature do
  scenario 'The user search for an existing city', vcr: { cassette_name: :successful_request } do
    user_visits_the_home_page
    fill_in 'city', with: 'New York, New York, US'
    click_button 'Search'
    expect(page).to have_text 'New York'
  end

  scenario 'The user search for a non existing city', vcr: { cassette_name: :failed_request } do
    user_visits_the_home_page
    fill_in 'city', with: 'mystring'
    click_button 'Search'
    user_get_city_not_found_message
  end

  scenario 'The user clicks the search button without filling the search box',
           vcr: { cassette_name: :failed_request } do
    user_visits_the_home_page
    click_button 'Search'
    user_get_city_not_found_message
  end

  def user_visits_the_home_page
    visit '/'
    expect(page).to have_text 'Search for your city'
  end

  def user_get_city_not_found_message
    expect(page).to have_text 'City not found'
    expect(page).to have_text 'Please try again.'
  end
end
