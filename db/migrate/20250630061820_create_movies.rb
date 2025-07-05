class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.boolean :adult
      t.string :backdrop_path
      t.string :original_language
      t.string :original_title
      t.decimal :popularity
      t.string :poster_path
      t.string :release_date
      t.string :title
      t.text :description
      t.boolean :video

      t.timestamps
    end
  end
end
