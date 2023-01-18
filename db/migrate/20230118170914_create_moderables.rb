class CreateModerables < ActiveRecord::Migration[7.0]
  def change
    create_table :moderables do |t|
      t.boolean :is_accepted, default: false

      t.timestamps
    end
  end
end
