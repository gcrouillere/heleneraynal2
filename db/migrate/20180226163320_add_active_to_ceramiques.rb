class AddActiveToCeramiques < ActiveRecord::Migration[5.0]
  def change
    add_column :ceramiques, :active, :boolean
  end
end
