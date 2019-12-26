feature "View relative expenses" do
  scenario "a user can see all relative expenses belongin to a theme" do
    join_user_2
    join
    create_theme
    click_button "Budapest Holiday August 2019"
    add_expense
    invite_friend
    log_in_user_2
    click_button "Budapest Holiday August 2019"
    add_expense_2
    expect(page).to have_content "Andrea"
    expect(page).to have_content "Diotallevi"
    expect(page).to have_content "75"
    expect(page).to have_content "Derrick"
    expect(page).to have_content "Jones"
    expect(page).to have_content "-75"
  end
end
