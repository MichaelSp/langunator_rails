class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :user
      t.references :word1, index: true
      t.references :word2, index: true
      t.integer :section, default: 0
      t.integer :times_right, default: 0
      t.integer :times_wrong, default: 0
      t.integer :times_skipped, default: 0
      t.integer :times_resetted, default: 0

      t.timestamps
    end
  end
end
