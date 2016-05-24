class BlockedUser < ActiveRecord::Base
  belongs_to :users
  belongs_to :blocked_user, :class_name => "User"
end
