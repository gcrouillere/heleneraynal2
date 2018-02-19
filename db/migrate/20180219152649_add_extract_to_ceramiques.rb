class AddExtractToCeramiques < ActiveRecord::Migration[5.0]
  def change
    add_column :ceramiques, :extract, :string
  end
end
