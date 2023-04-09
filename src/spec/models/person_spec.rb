# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { build(:person) }

  let(:company_unit) { build(:company_unit) }

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'when person' do
      context 'is not assigned to company unit' do
        it { is_expected.to be_valid }
      end

      context  'is already assigned' do
        before do
          create(:company_unit_person, person:, company_unit:)
        end

        it 'is raises an error' do
          expect { person.build_company_unit_person(company_unit:) }.to raise_error(ActiveRecord::RecordNotSaved)
        end
      end
    end
  end
end
