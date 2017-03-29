require "rails_helper"

feature "user locatates nearest station" do
  scenario "they visit root" do
    visit root_path

    fill_in("Zipcode", :with => '80204')
    click("Submit")

    expect(current_path).to eq(search_path)
  end
end
