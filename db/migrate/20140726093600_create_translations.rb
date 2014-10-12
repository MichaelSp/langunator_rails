class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :user
      t.integer :section, default: 0
      t.integer :times_right, default: 0
      t.integer :times_wrong, default: 0
      t.integer :times_skipped, default: 0
      t.integer :times_resetted, default: 0

      t.timestamps
    end
  end
end
