class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :released
      t.string :release_yea

      t.timestamps
    end
  end
end
