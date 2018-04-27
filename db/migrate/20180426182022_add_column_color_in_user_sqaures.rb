class AddColumnColorInUserSqaures < ActiveRecord::Migration[5.1]
  def change
    add_column :user_squares, :color, :string
    add_column :squares, :user_name, :string
  end
end
