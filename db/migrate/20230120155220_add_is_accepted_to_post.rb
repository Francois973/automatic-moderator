class AddIsAcceptedToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :is_accepted, :boolean, default: false
  end
end
