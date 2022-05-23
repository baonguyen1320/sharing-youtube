# == Schema Information
#
# Table name: movies
#
#  id           :bigint           not null, primary key
#  description  :text
#  name         :string
#  youtube_code :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup
    users(:one).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_down)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:one).user_movie_votes.create!(movie: movies(:two), vote_type: :vote_up)
  end

  test '#vote_up_by' do
    assert_equal 1, movies(:one).vote_up_by(users(:one)).count
  end

  test '#vote_down_by' do
    assert_equal 1, movies(:one).vote_down_by(users(:two)).count
  end
end
