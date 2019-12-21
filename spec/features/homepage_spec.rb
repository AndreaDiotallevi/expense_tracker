feature "Homepage" do
  scenario "shows 'Welcome to the best expense tracker application out there!'" do
    visit "/"
    expect(page).to have_content "Welcome to the best expense tracker application out there!"
  end
end
