require 'rails_helper'

RSpec.describe "Teams new page", type: :feature do
   it 'has a form to submit a new team' do
      visit "/teams/new"

      fill_in 'name', with: 'Arsenal FC'
      fill_in 'state', with: 'Holloway'
      fill_in 'champ_position', with: 2
      fill_in 'hiring_players', with: 'true'

      click_button 'Add Team'

      expect(page).to have_content 'Teams'
      expect(page).to have_content 'Arsenal FC'
      expect(page).to have_content 'Created: '
      expect(page).to have_link 'New Team'
   end
end