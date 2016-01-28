class AddModels < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :albums do |t|
      t.string :name, null: false
      t.string :album_style, null: false
      t.integer :band_id, null: false

      t.timestamps null: false
    end

    create_table :tracks do |t|
      t.string :name, null: false
      t.string :track_style, null: false
      t.string :lyrics, null: true
      t.integer :album_id, null: false

      t.timestamps null: false
    end

    add_index :bands, :name, unique: true
    add_index :albums, :band_id
    add_index :tracks, :album_id
  end
end
