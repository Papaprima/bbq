# frozen_string_literal: true

# == Schema Information
#
# Table name: subscriptions
#
#  id           :integer      not null, primary key
#  user_name        :string
#  user_email  :string
#  user_id      :integer
#  created_at   :datetime      not null
#  updated_at   :datetime      not null
#
class Subscription < ActiveRecord::Base
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end
end
