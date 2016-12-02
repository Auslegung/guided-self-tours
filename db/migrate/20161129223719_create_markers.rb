class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :title
      t.text :description
      t.string :audio
      t.string :category
      t.belongs_to :user
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
