# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LunchEvents::NewEventForm, type: :model do # rubocop:disable Metrics/BlockLength
  let(:venue) { create(:venue) }
  let(:scheduled_at) { Time.zone.now + 1.minute }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:scheduled_at) }
    it { is_expected.to validate_presence_of(:venue_id) }

    context 'when form' do
      subject { described_class.new(scheduled_at:, venue_id: 1) }

      it { is_expected.to be_valid }

      context 'when scheduled_at is in the past' do
        subject { described_class.new(scheduled_at: Time.zone.now - 1.day, venue_id: 1) }

        it { is_expected.not_to be_valid }
      end

      context 'when overlapping lunch event' do
        before do
          create(:lunch_event, scheduled_at:, venue_id: venue.id)
        end

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#save' do
    subject { described_class.new(scheduled_at: Time.zone.now + 1.week, venue_id:) }

    let(:venue_id) { venue.id }

    before { venue }

    it 'creates a new LunchEvent' do
      expect { subject.save }.to change(LunchEvent, :count).by(1)
    end

    context 'when venue is not found' do
      let(:venue_id) { 0 }

      it 'does not create a new LunchEvent' do
        expect { subject.save }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
