# frozen_string_literal: true

# class SortingHat
# Group persons to event groups and validate
class SortingHat
  attr_reader :identities,
              :number_of_groups,
              :new_groups

  # @param [Array<Array<person_id, team_id>>] identities
  # @param [Integer] number_of_groups
  # @return [Array<EventGroup>]
  def initialize(identities:, number_of_groups:)
    @identities = identities.group_by(&:last)
                            .each_with_object([]) do |e, o|
                              o << e[1].map(&:first)
                            end.flatten
    @number_of_groups = number_of_groups
    @new_groups = Array.new(number_of_groups) { [] }
  end

  def to_houses
    identities.each do |person|
      find_house << person
    end

    new_groups
  end

  private

  def find_house
    new_groups.min_by(&:size)
  end
end
