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

  enum vote_type: { vote_up: 'Vote up', vote_down: 'Vote down' }
end
