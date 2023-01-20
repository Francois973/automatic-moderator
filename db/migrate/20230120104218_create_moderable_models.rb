class CreateModerableModels < ActiveRecord::Migration[7.0]
  def change
    create_table :moderable_models do |t|
      t.text :content
      t.boolean :is_accepted, default: false

      t.timestamps
    end
  end
end
