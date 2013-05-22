class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.integer :college_id
      t.integer :course_id

      t.timestamps
    end
  end
end
