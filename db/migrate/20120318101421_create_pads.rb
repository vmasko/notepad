class CreatePads < ActiveRecord::Migration
  def change
    create_table :pads do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
