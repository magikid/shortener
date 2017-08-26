require 'rails_helper'

RSpec.feature "Shortened links", type: :feature do
  scenario "User creates a new shortened url" do
    log_in(email: "foo@bar.com")

    visit new_site_path

    fill_in "Url", with: "https://google.com"
    click_button "Submit"

    expect(page).to have_text("https://google.com")
  end

  scenario "User creates more than one shortened url" do
    log_in(email: "foo@bar.com")

    visit new_site_path
    fill_in "Url", with: "https://google.com"
    click_button "Submit"

    visit new_site_path
    fill_in "Url", with: "https://yahoo.com"
    click_button "Submit"

    visit sites_path
    expect(page).to have_text("https://google.com")
    expect(page).to have_text("https://yahoo.com")
  end


  private

  def log_in(email: "foo@bar.com")
    visit root_path
    find("#sign-in-link").click
  end
end
