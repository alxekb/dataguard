# frozen_string_literal: true

# class LunchEvent
#
# Lunch event is a core entity of thee system.
class LunchEvent < ApplicationRecord
  belongs_to :venue

  has_many :lunch_event_persons
  has_many :people, through: :lunch_event_persons

  validates :scheduled_at, presence: true
  validates :venue, uniqueness: { scope: :scheduled_at }

  scope :upcoming, -> { where('scheduled_at > ?', Time.zone.now) }
  scope :scheduled_asc, -> { order(scheduled_at: :asc) }
  scope :latest, -> { upcoming.scheduled_asc.take(12) }
end
