# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  email    :text
#  password :text
#

class User < ActiveRecord::Base
  has_many :stories
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
