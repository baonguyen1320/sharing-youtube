class CreateUserMovieVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_movie_votes do |t|
      t.references :user
      t.references :movie
      t.string :vote_type

      t.timestamps
    end
  end
end
