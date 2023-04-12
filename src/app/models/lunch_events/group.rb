# frozen_string_literal: true

module LunchEvents
  # class LunchEvents::Group
  #
  # This class is responsible for creating groups for a lunch event.
  class Group < ApplicationRecord
    belongs_to :leader, class_name: 'Person', foreign_key: 'leader_id'
    belongs_to :lunch_event

    has_many :group_memberships, dependent: :destroy, class_name: LunchEvents::Groups::Membership.name

    validates :leader, :lunch_event, presence: true

    def allocatable?
      group_memberships.size.zero? # rubocop:disable Style/ZeroLengthPredicate
    end
  end
end
