class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :word, index: true
      t.references :word, index: true
      t.integer :times_right
      t.integer :times_wrong
      t.integer :times_skiped
      t.integer :times_resetted

      t.timestamps
    end
  end
end
