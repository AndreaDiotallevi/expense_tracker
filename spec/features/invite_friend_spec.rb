feature "Invite a user to a theme" do
  scenario "a user can invite another user to participate to a theme" do
    sign_up_user_2
    sign_up
    create_theme
    click_button "Budapest Holiday August 2019"
    click_button "Invite a Friend"
    fill_in "first-name", with: "Derrick"
    fill_in "surname", with: "Jones"
    click_button "Invite Friend"
    expect(page).to have_content "2 Participants:"
    expect(page).to have_content "Andrea Diotallevi"
    expect(page).to have_content "Derrick Jones"
  end
end
