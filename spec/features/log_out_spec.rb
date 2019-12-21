feature "Log out" do
  scenario "A user can log out" do
    sign_up
    click_button "Log Out"

    expect(page).to have_current_path "/"
    expect(page).to have_content "You have logged out"
  end
end
