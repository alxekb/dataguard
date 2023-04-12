# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LunchEvents::AllocateGroups', type: :request do
  describe 'POST' do
    let(:venue) { create(:venue) }
    let(:lunch_event) { create(:lunch_event, venue:) }
    let!(:group) { create(:group, leader: person, lunch_event:) }
    let(:person) { create(:person) }

    it 'returns http success' do
      post '/lunch_events/allocate_groups'
      expect(response).to have_http_status(:success)
    end

    context 'when lunch_event group' do
      let(:persons_count) { 3 }
      let!(:persons) { create_list(:person, persons_count) }

      it 'creates lunch event group memberships' do
        expect do
          post '/lunch_events/allocate_groups'
        end.to change { LunchEvents::Groups::Membership.count }.by(persons_count.next)
      end
    end
  end
end
