class CreateUserSquares < ActiveRecord::Migration[5.1]
  def change
    create_table :user_squares do |t|
      t.references :user, index: true, foreign_key: true
      t.references :square, index: true, foreign_key: true

      t.timestamps
    end
  end
end
