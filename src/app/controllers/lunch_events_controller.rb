# frozen_string_literal: true

# class LunchEventsController
#
# This controller is responsible for displaying upcoming lunch events.
class LunchEventsController < ApplicationController
  def index
    @lunch_events = LunchEvent.includes(:venue).latest
    @group = LunchEvents::Group.new
    @groups = LunchEvents::Group.includes(:leader, lunch_event: :venue).last(12)
    @people = Person.all.pluck(:id)
  end
end
