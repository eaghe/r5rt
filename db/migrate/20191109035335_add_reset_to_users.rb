class AddResetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_digest, :string
    add_index :users, :reset_digest
    add_column :users, :reset_sent_at, :datetime
  end
end
