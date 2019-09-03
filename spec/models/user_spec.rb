require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  describe 'associations' do
    # Association test
    # ensure User model has a 1:m relationship with the Account model.
    it { should have_many(:accounts).dependent(:destroy) }
  end

  describe 'validations' do
    # Validation tests
    # ensure column Name is present before saving
    it { should validate_presence_of(:name) }
  end  
end
