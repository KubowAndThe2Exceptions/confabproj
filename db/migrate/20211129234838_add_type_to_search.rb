class AddTypeToSearch < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :userType, :string
  end
end
