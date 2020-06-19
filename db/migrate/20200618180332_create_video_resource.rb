class CreateVideoResource < ActiveRecord::Migration[6.0]
  def change
    create_table :video_resources do |t|
      t.string :name
      t.string :description
      t.string :url
      t.timestamps
    end
  end
end
