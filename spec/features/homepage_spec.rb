feature "Homepage" do
  scenario "it shows 'Welcome to the expense tracker app'" do
    visit "/"
    expect(page).to have_content "Welcome to the expense tracker app"
  end
end
