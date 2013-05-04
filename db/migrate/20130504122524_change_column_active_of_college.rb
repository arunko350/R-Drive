class ChangeColumnActiveOfCollege < ActiveRecord::Migration
  def up
  	change_column :colleges, :active, :boolean, :default => false
  end

  def down
  	change_column :colleges, :active, :boolean, :default => true
  end
end
