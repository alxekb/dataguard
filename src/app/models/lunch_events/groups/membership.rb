# frozen_string_literal: true

module LunchEvents
  module Groups
    # class LunchEvents::Groups::Membership
    #
    # This class is responsible for creating a membership between a group and a member.
    class Membership < ApplicationRecord
      belongs_to :member, class_name: Person.name, foreign_key: 'member_id'
      belongs_to :group, class_name: LunchEvents::Group.name, foreign_key: 'group_id'

      validates :group, :member, presence: true
    end
  end
end
