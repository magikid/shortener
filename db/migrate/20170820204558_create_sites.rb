class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :short_code, null: false, index: true
      t.string :url, null: false
      t.integer :hits, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
