feature "Sign up" do
  scenario "A user can create an account" do
    sign_up
    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Signed in as Andrea"
  end

  scenario "A user is notified when he enters a non-matching confirmed password" do
    visit "/"
    click_button "Sign Up"
    fill_in "first-name", with: "Andrea"
    fill_in "surname", with: "Diotallevi"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "password"
    fill_in "confirm-password", with: "wrong-password"
    click_button "Sign Up"
    expect(page).to have_current_path "/users/new"
    expect(page).to have_content "Please enter two matching passwords"
  end
end
