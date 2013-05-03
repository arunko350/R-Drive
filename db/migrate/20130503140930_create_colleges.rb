zclass CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.text :description
      t.hstore :address
      t.hstore :contact
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
