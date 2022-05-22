class AddUserIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :user, index: true, foreign_key: true
  end
end
