class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :name
      t.string :code
      t.string :term
      t.references :shift
      t.references :profesion
      t.references :checkins
      t.references :study_plan
      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
