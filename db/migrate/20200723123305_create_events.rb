class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event
      t.string :event_deadline

      t.timestamps
    end
  end
end
