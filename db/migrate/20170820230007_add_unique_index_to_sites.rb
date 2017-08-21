class AddUniqueIndexToSites < ActiveRecord::Migration[5.1]
  def change
    add_index :sites, :short_cide, unique: true
  end
end
