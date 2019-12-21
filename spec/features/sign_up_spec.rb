feature "Sign up" do
  scenario "A user can create an account" do
    sign_up

    expect(page).to have_current_path "/themes"
    expect(page).to have_content "Signed in as Andrea"
  end
end