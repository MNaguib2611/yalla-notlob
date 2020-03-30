class Group < ApplicationRecord
  # validates :name , uniqueness: true, presence: true
  belongs_to :user
  has_and_belongs_to_many :users, class_name:'User', join_table:'user_groups'
end
