require 'rails_helper'

feature 'Lookup weather report', :vcr do
  scenario 'they see the default address city name after clicking' do
    visit reports_show_path

    click_button 'Lookup'

    expect(page).to have_css("td", text: "San Francisco")
  end

  scenario 'they see the name of their city after entering an address and clicking' do
    visit reports_show_path

    page.fill_in 'address', with: '1368 Versailles Ave, Alameda, CA'

    click_button 'Lookup'

    expect(page).to have_css("td", text: "Alameda")
  end
end
