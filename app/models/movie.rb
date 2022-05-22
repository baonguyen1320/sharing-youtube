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

class Movie < ApplicationRecord
  YOUTUBE_REGEX = /watch\?v=.*.&/

  belongs_to :user

  validates :youtube_code, presence: true, uniqueness: true, format: { with: YOUTUBE_REGEX, message: 'Invalid URL' }
  validate :youtube_code_unique_after_format

  private

  def youtube_code_unique_after_format
    self.youtube_code = youtube_code.split('watch?v=')[1]&.split('&').try(:first)

    errors.add(:youtube_code, 'has already been taken') if Movie.pluck(:youtube_code).include?(youtube_code)
  end
end
