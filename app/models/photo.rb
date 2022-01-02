# frozen_string_literal: true

# == Schema Information
#
# Table name: photos
#
#  id          :integer      not null, primary key
#  photo       :string
#  event_id    :integer
#  user_id     :integer
#  created_at  :datetime      not null
#  updated_at  :datetime      not null
#

class Photo < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL" }
end
