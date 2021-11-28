class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :location
      t.text :address
      t.string :zip
      t.string :description
      t.text :describe
      t.boolean :admin, default: false
      t.boolean :event
      t.boolean :venue
      t.boolean :press
      t.boolean :vendor
      t.boolean :standard
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.boolean :activated, default: false
      t.datetime :activated_at
      t.string :activation_digest
	  
      t.timestamps

    end
  end
end