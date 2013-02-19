class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :gist_id

      t.timestamps
    end

    add_index :taggings, [:tag_id, :gist_id], :unique => true
  end
end
