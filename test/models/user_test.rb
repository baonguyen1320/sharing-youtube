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
  # test "the truth" do
  #   assert true
  # end
end
