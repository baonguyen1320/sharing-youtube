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
  # test "the truth" do
  #   assert true
  # end
end
