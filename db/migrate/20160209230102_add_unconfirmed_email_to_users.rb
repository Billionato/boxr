class AddUnconfirmedEmailToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      ## Confirmable
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
  end
end
