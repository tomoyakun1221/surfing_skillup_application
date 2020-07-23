class CreateImageVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :image_videos do |t|
      t.string :name
      t.string :title
      t.string :image
      t.string :video
      t.string :impression_student
      t.string :impression_owner
      t.date :day

      t.timestamps
    end
  end
end
