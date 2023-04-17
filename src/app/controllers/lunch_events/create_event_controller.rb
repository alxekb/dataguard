# frozen_string_literal: true

module LunchEvents
  # Create new LunchEvent
  class CreateEventController < ApplicationController
    before_action :venues, only: %i[index create]

    def index
      @lunch_event = LunchEvent.new
    end

    def create
      @form = LunchEvents::NewEventForm.new(**lunch_event_form_attributes)

      if @form.save
        redirect_to lunch_events_path
      else
        flash.now[:error] = @form.errors.full_messages.join(', ')

        render :index
      end
    end

    private

    def lunch_event_form_attributes
      {
        scheduled_at: Time.zone.parse(lunch_event_params[:scheduled_at]),
        venue_id: lunch_event_params[:venue_id]
      }
    end

    def lunch_event_params
      params.require(:lunch_event)
            .permit(:scheduled_at, :venue_id)
    end

    def venues
      @venues ||= Venue.take(12)
    end
  end
end
