# == Schema Information
#
# Table name: stories
#
#  id      :integer          not null, primary key
#  title   :text
#  summary :text
#  user_id :integer
#

class Story < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, presence: true
end
