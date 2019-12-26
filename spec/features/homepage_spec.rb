feature "Homepage" do
  scenario "a user can see the text 'The Expense Tracker'" do
    visit "/"
    expect(page).to have_content "The Expense Tracker"
  end
end
