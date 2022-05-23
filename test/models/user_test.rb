# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string
#  sign_in_count      :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'destroy_voted_movie' do
    users(:one).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_down)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:one).user_movie_votes.create!(movie: movies(:two), vote_type: :vote_up)

    users(:one).destroy_voted_movie(movies(:one))

    assert_empty users(:one).user_movie_votes.where(movie_id: movies(:one).id)
  end
end
