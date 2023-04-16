# frozen_string_literal: true

# class LunchEventsController
#
# This controller is responsible for displaying upcoming lunch events.
class LunchEventsController < ApplicationController
  def index
    @lunch_events = LunchEvent.includes(:venue).latest
  end
end
