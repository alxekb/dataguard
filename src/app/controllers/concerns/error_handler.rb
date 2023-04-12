# frozen_string_literal: true

# class ErrorHandler
#
# This module is used to handle errors and send them to the user.
module ErrorHandler
  def self.included(base)
    base.class_eval do
      rescue_from NoGroupsAllocatedError, with: :no_groups_allocated
    end
  end

  private

  def no_groups_allocated(error)
    Rails.logger.error(error.message)

    redirect_to lunch_events_allocated_groups_path
  end
end

class NoGroupsAllocatedError < StandardError; end
