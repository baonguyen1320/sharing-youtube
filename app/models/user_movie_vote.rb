# == Schema Information
#
# Table name: user_movie_votes
#
#  id         :bigint           not null, primary key
#  vote_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint
#  user_id    :bigint
#
class UserMovieVote < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  after_commit :update_total_up_votes,   if: :vote_up?
  after_commit :update_total_down_votes, if: :vote_down?

  enum vote_type: { vote_up: 'Vote up', vote_down: 'Vote down' }

  private

  def update_total_up_votes
    movie.update_total_up_votes
  end

  def update_total_down_votes
    movie.update_total_down_votes
  end
end
