feature "Create a new theme" do
  scenario "A user can create a new theme" do
    sign_up
    click_button "Add a New Theme"
    expect(page).to have_current_path "/themes/new"
    fill_in "title", with: "Budapest Holiday August 2019"
    click_button "Add This Theme"
    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Budapest Holiday August 2019"
  end
end
