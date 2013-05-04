class AddColumnUniversityCodeToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :university, :string
    add_column :colleges, :code, :string
  end
end
