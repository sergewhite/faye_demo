require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: channels
#
#  id                  :integer         not null, primary key
#  title               :string(255)
#  current_users_count :integer
#  current_users       :text
#  created_at          :datetime
#  updated_at          :datetime
#

