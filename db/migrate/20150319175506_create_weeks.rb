class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.text :data
      t.timestamps null: false
    end
  end
end
