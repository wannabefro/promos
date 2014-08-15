require 'rails_helper'

describe CodeGenerator do
  let(:promotion) { FactoryGirl.create(:promotion) }
  it 'should have a quantity between 1 and 100' do
    code_generator = CodeGenerator.new('unique', 101, promotion)
  end
end
