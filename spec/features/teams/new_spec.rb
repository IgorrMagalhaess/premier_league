require 'rails_helper'

RSpec.describe "Teams new page", type: :feature do
   it 'has a form to submit a new team' do
      visit "/teams/new"

      fill_in 'Name', with: 'Arsenal FC'
      fill_in 'State', with: 'Holloway'
      fill_in 'Position', with: 2
      fill_in 'On the Market', with: "true"

      click_button 'Submit'

      expect(page).to have_content 'Teams'
      expect(page).to have_content 'Arsenal FC'
      expect(page).to have_content 'Created: '
      expect(page).to have_link 'New Team'
      expect(page).to have_content 'On the Market:'
   end
end