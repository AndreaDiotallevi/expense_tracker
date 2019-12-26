feature "Create a new theme" do
  scenario "a user can create a new theme" do
    join
    create_theme
    expect(page).to have_current_path "/themes"
    expect(page).to have_selector :link_or_button, "Budapest Holiday August 2019"
  end
end
