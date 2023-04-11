# frozen_string_literal: true

# helper methods for scheduling events
module Schedulable
  def available?(scheduled_at)
    LunchEvent.where(scheduled_at:).empty?
  end
end
