class RenameTypeColumnInRobots < ActiveRecord::Migration[7.0]
  def change
    rename_column :robots, :type, :robot_type
  end
end
