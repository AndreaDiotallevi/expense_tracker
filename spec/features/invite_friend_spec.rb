feature "Invite a user to a theme" do
  scenario "a user can invite another user to participate to a theme" do
    sign_up_user_2
    sign_up
    create_theme
    click_button "Budapest Holiday August 2019"
    invite_friend
    log_in_user_2
    expect(page).to have_current_path "/themes"
    expect(page).to have_selector :link_or_button, "Budapest Holiday August 2019"
  end
end
