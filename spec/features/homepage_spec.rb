feature "Homepage" do
  scenario "a user can see the text 'Welcome to the expense tracker app'" do
    visit "/"
    expect(page).to have_content "Welcome to the expense tracker app"
  end
end
