class Account < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :balance, :name

  # Allow call balance attribute to get a money object from gem money-rails
  monetize :balance_cents

end
