require 'rails_helper'

RSpec.describe 'Edit team page', type: :feature do
  it 'has a way to update that team' do
    man_city = Team.create!(name: "Manchester City", state: "Manchester", champ_position: 3, hiring_players: false)
      
    visit "/teams/#{man_city.id}/edit"

    fill_in 'Name', with: 'Arsenal FC'
    fill_in 'State', with: 'Holloway'
    fill_in 'Position', with: 2
    fill_in 'Hiring', with: 'true'

    click_button 'Submit'

    expect(page).to have_content 'Teams'
    expect(page).to have_content 'Arsenal FC'
    expect(page).to have_content 'Position: 2'
  end
end
