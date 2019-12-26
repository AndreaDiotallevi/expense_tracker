feature "Log In" do
  scenario "a user can log in" do
    sign_up
    log_in
    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Signed in as Andrea"
  end

  scenario "a user cannot log in if he enters an incorrect email" do
    sign_up
    visit "/"
    click_button "Log in"
    fill_in "email", with: "wrong-email@gmail.com"
    fill_in "password", with: "password"
    click_button "Log in"
    expect(page).to have_current_path "/sessions/new"
    expect(page).to have_content "Please check your email or password"
  end
end
