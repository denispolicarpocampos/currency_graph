require 'rails_helper'

feature "User view links" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_link("EUR")
    expect(page).to have_link("USD")
    expect(page).to have_link("AUD")
    expect(page).to have_link("Today")
    expect(page).to have_link("Yesterday")
    expect(page).to have_link("1 week")
  end
end

feature "User view titles" do
  scenario "EUR" do
    visit currency_path("EUR")
    expect(page).to have_text("Graph of EUR")
  end

  scenario "USD" do
    visit currency_path("USD")
    expect(page).to have_text("Graph of USD")
  end

  scenario "AUD" do
    visit currency_path("AUD")
    expect(page).to have_text("Graph of AUD")
  end 
end