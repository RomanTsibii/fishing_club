class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :full_name, :string
  end
end
