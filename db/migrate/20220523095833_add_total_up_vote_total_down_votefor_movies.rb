class AddTotalUpVoteTotalDownVoteforMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :total_up_votes, :integer, default: 0
    add_column :movies, :total_down_votes, :integer, default: 0
  end
end
