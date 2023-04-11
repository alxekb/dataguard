# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SortingHat do
  describe '#to_houses' do
    let(:identities) do
      [
        [1, 1],
        [2, 1],
        [3, 2],
        [4, 2],
        [5, 3],
        [6, 3]
      ]
    end

    let(:number_of_groups) { 3 }

    let(:sorting_hat) { described_class.new(identities:, number_of_groups:) }

    it 'returns array of event groups' do
      expect(sorting_hat.to_houses).to eq(
        [
          [1, 4],
          [2, 5],
          [3, 6]
        ]
      )
    end
  end
end
