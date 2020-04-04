class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :friends_data, foreign_key: :user_id, class_name: 'Friend'
  # has_many :groups , foreign_key: :user_id , class_name: 'Group'
  has_many :friends, foreign_key: :friend_id, class_name: 'Friend'
  has_many :users, through: :friends

  has_and_belongs_to_many :groups, class_name:'Group', join_table:'user_groups'
  has_many :user_notifications
  #has_many :friends
  #has_many :friends, :source => :friend, :through => :friends
end
