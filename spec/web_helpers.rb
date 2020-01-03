def sign_up
  visit "/"
  click_button "Join"
  fill_in "first-name", with: "Andrea"
  fill_in "surname", with: "Diotallevi"
  fill_in "email", with: "test@gmail.com"
  fill_in "password", with: "password"
  fill_in "confirm-password", with: "password"
  click_button "Sign up"
end

def sign_up_user_2
  visit "/"
  click_button "Join"
  fill_in "first-name", with: "Derrick"
  fill_in "surname", with: "Jones"
  fill_in "email", with: "derrick@gmail.com"
  fill_in "password", with: "password"
  fill_in "confirm-password", with: "password"
  click_button "Sign up"
end

def log_in
  visit "/"
  click_button "Log in"
  fill_in "email", with: "test@gmail.com"
  fill_in "password", with: "password"
  click_button "Log in"
end

def log_in_user_2
  visit "/"
  click_button "Log in"
  fill_in "email", with: "derrick@gmail.com"
  fill_in "password", with: "password"
  click_button "Log in"
end

def create_theme
  click_button "Create a theme"
  expect(page).to have_current_path "/themes/new"
  fill_in "title", with: "Budapest Holiday August 2019"
  click_button "Create theme"
end

def invite_friend
  click_button "Invite a Friend"
  fill_in "email", with: "derrick@gmail.com"
  click_button "Invite Friend"
end

def add_expense
  click_button "Add New Expense"
  fill_in "amount", with: "200.00"
  fill_in "description", with: "Restaurant"
  click_button "Add This Expense"
end

def add_expense_2
  click_button "Add New Expense"
  fill_in "amount", with: "50.00"
  fill_in "description", with: "Museum"
  click_button "Add This Expense"
end
