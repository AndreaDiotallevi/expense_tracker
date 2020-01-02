feature "Add an expense" do
  scenario "a user can add an expense to a theme for which he participates" do
    sign_up
    create_theme
    click_button "Budapest Holiday August 2019"
    click_button "View Expenses"
    add_expense
    expect(page).to have_content "Andrea"
    expect(page).to have_content "Diotallevi"
    expect(page).to have_content "200.00"
    expect(page).to have_content "Restaurant"
  end
end
