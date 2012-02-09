class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :arrival_time
      t.string :location

      t.timestamps
    end
  end
end
