class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.twitter :text
      t.facebook :text

      t.timestamps null: false
    end
  end
end
