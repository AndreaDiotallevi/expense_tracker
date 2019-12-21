class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :password
    end
  end
end
