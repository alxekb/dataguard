# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LunchEvents::CreateEvents', type: :request do
  describe 'GET /create' do
    let(:venue) { create(:venue) }
    let(:params) do
      {
        lunch_event: {
          scheduled_at: Time.zone.now + 1.week,
          venue_id: venue.id
        }
      }
    end

    it 'returns http success' do
      post('/lunch_events/create_event', params:)

      expect(response).to have_http_status(:redirect)
    end

    it 'creates a new LunchEvent' do
      expect { post('/lunch_events/create_event', params:) }
        .to change(LunchEvent, :count).by(1)
    end
  end
end
