# frozen_string_literal: true

# class GroupsController
#
# This class is responsible for displaying groups for a lunch event.
class GroupsController < ApplicationController
  def index
    @groups = LunchEvents::Group.includes(:lunch_event, :leader).last(12)
  end

  def show
    @group = LunchEvents::Group.find(params[:id])
    @user_ids = Person.ids
  end
end
