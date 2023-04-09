# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LunchEvent, type: :model do
  subject(:lunch_event) { build(:lunch_event) }

  describe 'validations' do
    let(:venue) { create(:venue) }

    it { is_expected.to validate_presence_of(:scheduled_at) }

    context 'when venue' do
      context 'is not assigned' do
        before { lunch_event.venue = nil }

        it { is_expected.not_to be_valid }
      end

      context 'is assigned' do
        before { lunch_event.venue = venue }

        it { is_expected.to be_valid }
      end

      context 'is scheduled at the same time' do
        before do
          create(:lunch_event, venue:, scheduled_at: lunch_event.scheduled_at)
        end

        it { is_expected.not_to be_valid }
      end
    end
  end
end
