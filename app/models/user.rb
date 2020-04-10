class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :orders, dependent: :delete_all

  has_many :friends_data, foreign_key: :user_id, class_name: 'Friend', dependent: :delete_all
  # has_many :groups , foreign_key: :user_id , class_name: 'Group'
  has_many :added_friends, foreign_key: :friend_id, class_name: 'Friend', dependent: :delete_all
  has_many :users, through: :added_friends, dependent: :delete_all

  has_many :added_users, foreign_key: :user_id, class_name: 'Friend', dependent: :delete_all
  has_many :friends, through: :added_users, dependent: :delete_all

  has_and_belongs_to_many :groups, class_name:'Group', join_table:'user_groups', dependent: :delete_all
  has_many :notifications, foreign_key: :user_id, dependent: :delete_all
  has_many :order_items, dependent: :delete_all
  has_many :user_invited_to_orders, foreign_key: :guest_id, dependent: :delete_all
  has_many :user_join_orders, dependent: :delete_all
  #has_many :friends
  #has_many :friends, :source => :friend, :through => :friends



def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
    user.email = data["email"] if user.email.blank?
    end
  end
end


def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
  end
end


  
end
