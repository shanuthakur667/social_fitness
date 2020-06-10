class User < ApplicationRecord
  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_groups
  has_many :groups, through: :user_groups

  def strangers
    users = []
    User.all.each do |user|
      if(self.friends_with?(user) != true && self != user &&       self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
        users << user
      end
    end
    users
  end

  def send_friend_request(user)
    self.friend_request(user)
  end

  def accept_friend_request(user)
    self.accept_request(user)
  end
end
