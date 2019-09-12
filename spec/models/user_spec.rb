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
    # ensure column username is present before saving
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }

  end  
end
