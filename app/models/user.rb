class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
    
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user
  
  has_many :blocked_users

  
  def friends
    active_friends | passive_friends
  end

  before_save { self.email = email.downcase }
  validates :username, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end

