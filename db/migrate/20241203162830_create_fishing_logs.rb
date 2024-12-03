class CreateFishingLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :fishing_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lake, null: false, foreign_key: true
      t.date :date
      t.string :species
      t.text :notes
      t.string :lures
      t.string :photo

      t.timestamps
    end
  end
end
