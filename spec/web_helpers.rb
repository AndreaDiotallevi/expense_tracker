def sign_up
  visit "/"
  click_button "Sign Up"
  fill_in "first-name", with: "Andrea"
  fill_in "surname", with: "Diotallevi"
  fill_in "email", with: "test@gmail.com"
  fill_in "password", with: "password"
  fill_in "confirm-password", with: "password"
  click_button "Sign Up"
end

def log_in
  visit "/"
  click_button "Log In"
  fill_in "email", with: "test@gmail.com"
  fill_in "password", with: "password"
  click_button "Log In"
end

def create_theme
  click_button "Create a New Theme"
  expect(page).to have_current_path "/themes/new"
  fill_in "title", with: "Budapest Holiday August 2019"
  click_button "Create Theme"
end
