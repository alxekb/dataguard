# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyUnit, type: :model do
  subject(:company_unit) { build(:company_unit) }

  let(:person) { build(:person) }
  let(:company_unit_person) { create(:company_unit_person, company_unit:, person:) }

  describe 'associations' do
    it { is_expected.to have_many(:company_unit_people) }
    it { is_expected.to have_many(:employees) }
  end

  describe 'validations' do
    context 'when person is assigned to unit' do
      before { company_unit_person }

      it { is_expected.to be_valid }

      context 'when person is already assigned' do
        before do
          company_unit.company_unit_people
                      .create(person:, company_unit:)
        end

        it { is_expected.not_to be_valid }
      end
    end
  end
end
