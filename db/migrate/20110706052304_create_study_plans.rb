class CreateStudyPlans < ActiveRecord::Migration
  def self.up
    create_table :study_plans do |t|
      t.string :name, :null => false
      t.references :campus, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :study_plans
  end
end
