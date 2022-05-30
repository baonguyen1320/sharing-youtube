# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint
#  user_id    :bigint
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
