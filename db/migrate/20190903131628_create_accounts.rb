class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :balance_cents, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
