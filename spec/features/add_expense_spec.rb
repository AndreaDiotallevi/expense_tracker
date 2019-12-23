feature "Add an expense" do
  scenario "A user can add an expense to a theme for which he participates" do
    sign_up
    create_theme
    click_button "Budapest Holiday August 2019"
    click_button "Add New Expense"
    fill_in "amount", with: "200"
    fill_in "description", with: "Restaurant"
    click_button "Add This Expense"
    expect(page).to have_content "Andrea"
    expect(page).to have_content "Diotallevi"
    expect(page).to have_content "£200"
    expect(page).to have_content "Restaurant"
  end
end
