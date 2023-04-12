# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LunchEvents::Groups::Membership, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:group) }
    it { is_expected.to validate_presence_of(:member) }
  end
end
