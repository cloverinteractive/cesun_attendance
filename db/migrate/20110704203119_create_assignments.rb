class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :name
      t.string :code
      t.string :term

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
