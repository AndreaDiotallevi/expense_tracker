feature "Add an expense" do
  scenario "a user can add an expense to a theme for which he participates" do
    join
    create_theme
    click_button "Budapest Holiday August 2019"
    add_expense
    expect(page).to have_content "Andrea"
    expect(page).to have_content "Diotallevi"
    expect(page).to have_content "200"
    expect(page).to have_content "Restaurant"
  end
end
