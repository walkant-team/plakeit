require 'rails_helper'

feature 'Home' do
  scenario 'Events of week' do
    event = create(:event, :public)

    visit root_path

    expect(page).to have_content(event.title)
  end
end
