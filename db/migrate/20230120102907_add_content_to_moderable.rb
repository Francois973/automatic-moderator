class AddContentToModerable < ActiveRecord::Migration[7.0]
  def change
    add_column :moderables, :content, :text
  end
end
