class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.string :description
      t.references :assigments
      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
