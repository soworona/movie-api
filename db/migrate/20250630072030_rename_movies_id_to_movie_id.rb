class RenameMoviesIdToMovieId < ActiveRecord::Migration[8.0]
  def change
        rename_column :comments, :movies_id, :movie_id
  end
end
