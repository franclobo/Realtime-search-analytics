class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.string :ip_address
      t.text :phrase
      t.integer :count

      t.timestamps
    end
  end
end
