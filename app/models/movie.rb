# == Schema Information
#
# Table name: movies
#
#  id               :bigint           not null, primary key
#  description      :text
#  name             :string
#  total_down_votes :integer          default(0)
#  total_up_votes   :integer          default(0)
#  youtube_code     :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#

class Movie < ApplicationRecord
  YOUTUBE_REGEX = /watch\?v=.*.&/

  belongs_to :user

  has_many :comments

  has_many :user_movie_votes
  has_many :user_votes, through: :user_movie_votes, source: :user

  has_many :user_vote_ups, -> { merge(UserMovieVote.vote_up) }, class_name: 'UserMovieVote'
  has_many :user_vote_downs, -> { merge(UserMovieVote.vote_down) }, class_name: 'UserMovieVote'

  validates :youtube_code, presence: true, uniqueness: true, format: { with: YOUTUBE_REGEX, message: 'Invalid URL' }
  validate :youtube_code_unique_after_format

  def vote_up_by(user)
    user_vote_ups.where(user_id: user&.id)
  end

  def vote_down_by(user)
    user_vote_downs.where(user_id: user&.id)
  end

  def update_total_up_votes
    update_column :total_up_votes, user_vote_ups.count
  end

  def update_total_down_votes
    update_column :total_down_votes, user_vote_downs.count
  end

  private

  def youtube_code_unique_after_format
    self.youtube_code = youtube_code.split('watch?v=')[1]&.split('&').try(:first)

    errors.add(:youtube_code, 'has already been taken') if Movie.pluck(:youtube_code).include?(youtube_code)
  end
end
