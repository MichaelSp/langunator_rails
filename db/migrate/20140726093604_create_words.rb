class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :language, index: true
      t.string :name
      t.integer :times_wrong
      t.integer :times_right
      t.integer :times_reseted
      t.integer :times_skiped

      t.timestamps
    end
  end
end
