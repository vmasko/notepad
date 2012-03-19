class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :pad_id
      t.string :title
      t.text :content
      t.string :keywords

      t.timestamps
    end
  end
end
