class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :search_input

      t.timestamps
    end
  end
end
