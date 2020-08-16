class CreateImageVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :image_videos do |t|
      t.string :title
      t.string :image
      t.string :video
      t.string :impression_student
      t.string :impression_owner
      t.date :photograph_day_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
