class AddMissingIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :users, [:id, :type]
  end
end
