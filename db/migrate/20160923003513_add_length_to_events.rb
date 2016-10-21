class AddLengthToEvents < ActiveRecord::Migration
  def change
    add_column :events, :length, :string
  end
end
