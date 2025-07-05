class ChangeRatingDecimalWithScale < ActiveRecord::Migration[8.0]
  def change
    change_column :ratings, :rating, :decimal, precision: 5, scale: 2
  end
end
