# frozen_string_literal: true

module LunchEvents
  # class LunchEvents::CreateGroupsController
  #
  # This controller is responsible for creating groups for a lunch event.
  class CreateGroupsController < ApplicationController
    before_action :lunch_event, only: %i[create]

    def index
      @lunch_events = LunchEvent.includes(:venue).latest
      @people = Person.all.includes(:company_unit).pluck('company_units.name', :id).map do |person|
        [[person.first, person.last].join(' - '), person.last]
      end
      @group = LunchEvents::Group.new
    end

    def create
      @group = @lunch_event.groups.build(group_params)

      if @group.save
        redirect_to groups_path
      else
        render :index
      end
    end

    private

    def group_params
      params.require(:lunch_events_group)
            .permit(:lunch_event_id, :leader_id)
    end

    def lunch_event
      @lunch_event ||= LunchEvent.find(group_params[:lunch_event_id])
    end
  end
end
