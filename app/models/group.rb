class Group < ActiveRecord::Base
  validates :title, presence: true

  has_many :posts, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :group_users
  has_many :members, through: :group_users, source: :user

  after_create :join_owner_to_group

  def editable_by?(user)
    user == owner
  end

  def join_owner_to_group
    members << owner
  end
end
