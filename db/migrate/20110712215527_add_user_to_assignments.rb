class AddUserToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.references :user
    end
  end

  def self.down
  end
end
