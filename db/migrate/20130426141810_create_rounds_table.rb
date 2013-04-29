class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :deck
      t.references :user
      t.integer :count_correct
      t.integer :count_wrong
    end
  end
end
