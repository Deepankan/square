class CreateSquares < ActiveRecord::Migration[5.1]
  def change
    create_table :squares do |t|
      t.string :previous_color
      t.string :current_color

      t.timestamps
    end

    40.times { |h| Square.create}
  end
end
