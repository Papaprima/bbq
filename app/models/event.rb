# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id           :integer      not null, primary key
#  title        :string
#  description  :text
#  address      :string
#  datetime     :datetime
#  created_at   :datetime      not null
#  updated_at   :datetime      not null
#  user_id      :integer
#

class Event < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
end
