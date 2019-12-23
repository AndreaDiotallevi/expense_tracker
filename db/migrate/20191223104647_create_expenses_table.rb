class CreateExpensesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :user
      t.belongs_to :theme
      # precision is the total number of digits
      # scale is the number of digits to the right of the decimal point
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :description
    end
  end
end
