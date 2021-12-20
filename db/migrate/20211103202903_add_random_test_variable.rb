class AddRandomTestVariable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :usertype, :string
  end
end
