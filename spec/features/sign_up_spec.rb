feature "Sign up" do
  scenario "A user can create an account" do
    visit "/"

    fill_in "first-name", with: "Andrea"
    fill_in "surname", with: "Diotallevi"
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "password"
    fill_in "confirm-password", with: "password"
    click_button "Sign Up"

    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Signed in as Andrea"
  end
end
