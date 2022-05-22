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
require "test_helper"

class UserMovieVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
