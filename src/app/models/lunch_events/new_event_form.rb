# frozen_string_literal: true

module LunchEvents
  # LunchEvents::NewEventForm is a form object for creating a new LunchEvent
  class NewEventForm
    include ActiveModel::Model

    attr_accessor :venue_id, :scheduled_at

    validates :venue_id, presence: true
    validates :scheduled_at, presence: true
    validate :scheduled_at_is_in_future
    validate :venue_is_available
    validate :no_overlapping_events

    def initialize(venue_id: nil, scheduled_at: nil)
      @venue_id = venue_id
      @scheduled_at = scheduled_at
    end

    def save
      return false unless valid?

      LunchEvent.create!(venue_id:, scheduled_at:)
    end

    private

    def no_overlapping_events
      return if LunchEvent.where(venue_id:)
                          .where('scheduled_at = ?', scheduled_at)
                          .empty?

      errors.add(:scheduled_at, 'is already taken')
    end

    def venue_is_available
      return if Venue.available?(scheduled_at)

      errors.add(:venue_id, 'is not available at the scheduled time')
    end

    def scheduled_at_is_in_future
      return unless scheduled_at.present?

      errors.add(:scheduled_at, 'must be in the future') if scheduled_at < Time.zone.now
    end
  end
end
