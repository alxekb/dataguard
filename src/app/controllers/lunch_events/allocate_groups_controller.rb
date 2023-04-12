# frozen_string_literal: true

module LunchEvents
  # class LunchEvents::AllocateGroupsController
  #
  # This class is responsible for allocating groups for a lunch event.
  # LunchEvents::AllocateGroupsController is responsible for allocating groups of peoples
  class AllocateGroupsController < ApplicationController
    include ErrorHandler

    def create
      group_valid?

      allocate_groups

      redirect_to lunch_events_allocated_groups_path
    end

    private
    def group_valid?
      raise NoGroupsAllocatedError if groups_count.zero?

      # redirect_to lunch_events_allocated_groups_path if groups_count.zero?
    end


    def errors
      @errors ||= []
    end

    def allocate_groups
      ActiveRecord::Base.transaction do
        groups_count.positive? && users_id_by_group.each do |user_ids|
          group = groups.shift

          user_ids.each do |user_id|
            group.group_memberships.build(member_id: user_id)
          end

          group.save || errors << group.errors.full_messages
        end
      end
    end

    def users_id_by_group
      @users_id_by_group ||= SortingHat.new(identities:, number_of_groups: groups_count).to_houses
    end

    def identities
      @identities ||= Person.all.includes(:company_unit).pluck(:id, 'company_units.id')
    end

    def groups
      @groups ||= LunchEvents::Group.includes(:group_memberships).where(group_memberships: { id: nil }).to_a
    end

    def groups_count
      @groups_count ||= groups.size
    end
  end
end
