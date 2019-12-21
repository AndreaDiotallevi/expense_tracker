feature "Log In" do
  scenario "A user can log in" do
    sign_up
    log_in

    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Signed in as Andrea"
  end
end
