# frozen_string_literal: true

# helper methods for scheduling events
module Schedulable
  def available?(scheduled_at)
    return false unless scheduled_at
    return false if scheduled_at < Time.zone.now

    LunchEvent.where(scheduled_at:).empty?
  end
end
