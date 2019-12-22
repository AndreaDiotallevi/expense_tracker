class CreateParticipationsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :theme
    end
  end
end
