class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :language, index: true
      t.string :name

      t.timestamps
    end

    create_join_table :translations, :words
  end
end
