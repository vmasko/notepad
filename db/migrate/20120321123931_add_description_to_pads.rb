class AddDescriptionToPads < ActiveRecord::Migration
  def change
    add_column :pads, :description, :string

  end
end
