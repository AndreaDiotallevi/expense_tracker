feature "View a theme" do
  scenario "A user can view a theme for which he participates" do
    sign_up
    create_theme
    click_button "Budapest Holiday August 2019"
    expect(page).to have_content "Budapest Holiday August 2019"
  end
end
