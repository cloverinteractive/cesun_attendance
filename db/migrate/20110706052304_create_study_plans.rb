class CreateStudyplans < ActiveRecord::Migration
  def self.up
    create_table :studyplans do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :studyplans
  end
end
