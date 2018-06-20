class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :filename
      t.string :content_type
      t.binary :data
      t.integer :filesize

      t.timestamps
    end
  end
end
