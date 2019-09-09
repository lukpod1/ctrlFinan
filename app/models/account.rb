class Account < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :balance, :name
end
