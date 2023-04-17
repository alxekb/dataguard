# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LunchEvents::AllocatedGroups', type: :request do
  describe 'GET' do
    it 'returns http success' do
      get '/lunch_events/allocated_groups'
      expect(response).to have_http_status(:success)
    end
  end
end
