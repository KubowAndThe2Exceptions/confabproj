class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
