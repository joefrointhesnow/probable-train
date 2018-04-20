#creates activites
class Activities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :owner_ID
      t.text :description
      t.datetime :startTime
      t.string :duration
      t.string :activeCode
      # Add fields that let Rails automatically keep track
      #       # of when activities are added or modified:
      t.timestamps
    end
  end
end
