# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           not null
#  password_digest            :string           not null
#  session_token              :string           not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  fname                      :string           not null
#  lname                      :string           not null
#  date                       :string           not null
#  month                      :string           not null
#  year                       :string           not null
#  dob                        :date             not null
#  gender                     :boolean          not null
#  profile_photo_file_name    :string
#  profile_photo_content_type :string
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#  cover_photo_file_name      :string
#  cover_photo_content_type   :string
#  cover_photo_file_size      :integer
#  cover_photo_updated_at     :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
