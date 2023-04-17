# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LunchEvents::CreateGroupsController, type: :request do # rubocop:disable Metrics/BlockLength
  describe 'POST' do
    let(:lunch_event) { create(:lunch_event, venue:) }
    let(:venue) { create(:venue) }
    let(:person) { create(:person) }
    let(:params) do
      {
        lunch_events_group: {
          lunch_event_id: lunch_event.id,
          leader_id: person.id
        }
      }
    end

    it 'creates a group' do
      post(lunch_events_create_groups_path(lunch_event), params:)

      aggregate_failures do
        expect(response).to redirect_to(groups_path)
        expect(lunch_event.groups.count).to eq(1)
      end
    end
  end

  describe 'GET' do
    it 'returns http success' do
      get '/lunch_events/create_groups'

      expect(response).to have_http_status(:success)
    end
  end
end
