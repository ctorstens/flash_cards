class AddTokenColToUser < ActiveRecord::Migration
  def change
    def up
      add_column :users, :token, :string
    end

    def down
      remove_column :users, :token, :string
    end
  end
end
