class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :phone, :string
  end
end
