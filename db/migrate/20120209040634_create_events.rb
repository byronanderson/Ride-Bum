class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :destination
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
