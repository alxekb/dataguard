# frozen_string_literal: true

module LunchEvents
  # class LunchEvents::AllocateGroupsController
  #
  # This class show allocated groups for a lunch event.
  class AllocatedGroupsController < ApplicationController
    def index
      @memberships = LunchEvents::Groups::Membership.includes(:member, group: [:leader, { lunch_event: :venue }])
    end
  end
end
