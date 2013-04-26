class CreateDecksTable < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, :null => false
    end
  end
end
