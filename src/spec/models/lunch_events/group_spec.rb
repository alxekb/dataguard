# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LunchEvents::Group, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:leader) }
    it { is_expected.to validate_presence_of(:lunch_event) }

    context 'when group' do
      let(:person) { build(:person) }
      let(:venue) { create(:venue) }
      let(:lunch_event) { create(:lunch_event, venue:) }
      let(:group) { create(:group, leader: person, lunch_event:) }

      it 'is allocatable' do
        expect(group.allocatable?).to be true
      end

      context 'when group has joined members' do
        before do
          group.group_memberships.create(member: person)
        end

        it 'is not allocatable' do
          expect(group.allocatable?).to be false
        end
      end
    end
  end
end
