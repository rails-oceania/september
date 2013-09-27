require 'spec_helper'

describe 'Creating contacts' do
  it "save a contact" do
    visit root_path

    click_link 'Add Contact'

    fill_in 'First name', :with => 'Pat'
    fill_in 'Last name',  :with => 'Allan'
    fill_in 'Email',      :with => 'pat@freelancing-gods.com'
    click_button 'Save Contact'

    expect(page).to have_content('Saved contact Pat Allan')
  end
end
